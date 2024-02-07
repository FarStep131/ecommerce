class Customer::WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    endpoint_secret = Rails.application.credentials.dig(:stripe, :endpoint_secret)
    event = nil

    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, endpoint_secret
      )
    rescue JSON::ParserError => e
      # Invalid payload
      p e
      status 400
      return
    rescue Stripe::SignatureVerificationError => e
      # Invalid signature
      p e
      status 400
      return
    end

    case event.type
    when 'checkout.session.completed'
      session = event.data.object # sessionの取得
      customer = Customer.find(session.client_reference_id)
      return unless customer # 顧客が存在するかどうか確認

      # トランザクション処理開始
      ApplicationRecord.transaction do
        order = create_order(session) # sessionを元にordersテーブルにデータを挿入
        session_with_expand = Stripe::Checkout::Session.retrieve({ id: session.id, expand: ['line_items'] })
        session_with_expand.line_items.data.each do |line_item|
          create_order_details(order, line_item) # 取り出したline_itemをorder_detailsテーブルに登録
        end
      end
      # トランザクション処理終了
      customer.cart_items.destroy_all # 顧客のカート内商品を全て削除
      OrderMailer.complete(email: session.customer_details.email).deliver_later
      redirect_to session.success_url
    end
  end

  private

  def create_order(session)
    Order.create!({
                    customer_id: session.client_reference_id,
                    name: session.shipping.name,
                    postal_code: session.shipping.address.postal_code,
                    prefecture: session.shipping.address.state,
                    address1: session.shipping.address.line1,
                    address2: session.shipping.address.line2,
                    postage: session.shipping_options[0].shipping_amount,
                    billing_amount: session.amount_total,
                    status: 'confirm_payment'
                  })
  end

  def create_order_details(order, line_item)
    product = Stripe::Product.retrieve(line_item.price.product)
    purchased_product = Product.find(product.metadata.product_id)
    raise ActiveRecord::RecordNotFound if purchased_product.nil?

    order_detail = order.order_details.create!({
                                                 product_id: purchased_product.id,
                                                 price: line_item.price.unit_amount,
                                                 quantity: line_item.quantity
                                               })
    purchased_product.update!(stock: (purchased_product.stock - order_detail.quantity)) # 購入された商品の在庫数の更新
  end
end
