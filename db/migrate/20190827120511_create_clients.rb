class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.text :email
      t.string :company_name
      t.text :company_address
      t.string :company_siret
      t.string :category
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
