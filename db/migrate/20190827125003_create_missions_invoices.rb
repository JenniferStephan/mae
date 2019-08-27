class CreateMissionsInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :missions_invoices do |t|
      t.integer :man_day_quantity
      t.integer :price_rate
      t.integer :vat_rate

      t.references :mission, foreign_key: true
      t.references :invoice, foreign_key: true

      t.timestamps
    end
  end
end
