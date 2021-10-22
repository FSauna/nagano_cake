class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order
  
  def subtotal
    item.with_tax_price * amount
  end
  
  enum making_status: { disabled: 0, waiting: 1, making: 2, completed: 3 }
end
