class AddColumnAmountToMissionsInvoices < ActiveRecord::Migration[5.2]
  def change
    add_column :missions_invoices, :amount, :float
  end
end
