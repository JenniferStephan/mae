class ChangingTypeofVaTratetoMi < ActiveRecord::Migration[5.2]
  def change
    change_column :missions_invoices, :vat_rate, :float
  end
end
