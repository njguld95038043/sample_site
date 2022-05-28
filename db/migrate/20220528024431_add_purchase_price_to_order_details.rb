class AddPurchasePriceToOrderDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :order_details, :purchase_price, :integer
  end
end
