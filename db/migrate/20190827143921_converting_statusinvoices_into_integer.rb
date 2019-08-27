class ConvertingStatusinvoicesIntoInteger < ActiveRecord::Migration[5.2]
  def change
    remove_column :invoices, :status, :string
    add_column :invoices, :status, :integer, default: 0
  end
end
