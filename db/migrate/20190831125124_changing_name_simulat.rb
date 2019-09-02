class ChangingNameSimulat < ActiveRecord::Migration[5.2]
  def change
    rename_table :simulation, :simulations
  end
end
