class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.string :title
      t.string :reference
      t.date :creation_date
      t.date :due_date
      t.date :payment_date
      t.string :status
      t.float :total_amount_ht
      t.float :total_amount_ttc
      t.references :user, foreign_key: true
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
