class ChangingTextIntoString < ActiveRecord::Migration[5.2]
  def change
    change_column :missions, :name, :string
    change_column :missions, :description, :string
  end
end
