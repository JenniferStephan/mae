class AddDefaultValueToTaxrateinUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :tax_rate
    add_column :users, :tax_rate, :float, default: 0.22
  end
end
