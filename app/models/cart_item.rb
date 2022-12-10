class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  def line_total
    product.price * quantity
  end
end
