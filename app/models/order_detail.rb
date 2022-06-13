class OrderDetail < ApplicationRecord
  enum making_status: { not_yet: 0, waiting_production: 1, in_production: 2, complete_production: 3 }

  belongs_to :item
  belongs_to :order

  def subtotal
   purchase_price * quantity
  end

end