class CreatingSimulatorTable < ActiveRecord::Migration[5.2]
  def change
    create_table :simulation do |t|
      t.string :activity
      t.boolean :reglementary
      t.boolean :accre
      t.integer :year_existence
      t.float :result

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
