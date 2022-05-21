class CreateDeriveries < ActiveRecord::Migration[6.1]
  def change
    create_table :deriveries do |t|
      t.string :postal_code
      t.string :address
      t.string :name

      t.timestamps
    end
  end
end
