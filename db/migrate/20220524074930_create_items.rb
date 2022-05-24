class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre
      t.string :name
      t.string :image
      t.text :explanation
      t.integer :price
      t.boolean :is_active

      t.timestamps
    end
  end
end
