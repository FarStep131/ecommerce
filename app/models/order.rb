class Order < ApplicationRecord
  belongs_to :customer
  enum status: {
    waiting_payment: 0,
    confirm_payment: 1,
    shipped: 2,
    out_of_delivery: 3,
    delivered: 4
  }
  has_many :order_details, dependent: :destroy
end
