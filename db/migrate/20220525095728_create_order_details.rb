class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :item
      t.integer :order
      t.integer :purchase_price
      t.integer :quantity
      t.integer :making_status

      t.timestamps
    end
  end
end
