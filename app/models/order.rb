class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  
  belongs_to :customer
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum ordered_status: { waiting: 0, paid: 1, making: 2, preparing: 3, shipped: 4 }
  
end
