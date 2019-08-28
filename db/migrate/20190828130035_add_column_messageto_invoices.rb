class AddColumnMessagetoInvoices < ActiveRecord::Migration[5.2]
  def change
    add_column :invoices, :comment, :text
  end
end
