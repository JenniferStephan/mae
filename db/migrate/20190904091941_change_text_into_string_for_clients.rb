class ChangeTextIntoStringForClients < ActiveRecord::Migration[5.2]
  def change
    change_column :clients, :email, :string
    change_column :clients, :company_address, :string
  end
end
