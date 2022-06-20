class AddRateToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :rate, :integer
  end
end
