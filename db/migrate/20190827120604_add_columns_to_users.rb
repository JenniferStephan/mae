class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :siret, :string
    add_column :users, :profession, :string
    add_column :users, :tax_rate, :integer
    add_column :users, :vat, :integer
    add_column :users, :address, :string
    add_column :users, :phone_number, :string
    add_column :users, :entreprise_name, :string
    add_column :users, :website_url, :string
  end
end
