class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :item
      t.integer :quantity
      t.integer :name

      t.timestamps
    end
  end
end
