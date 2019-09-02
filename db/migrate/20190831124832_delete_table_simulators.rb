class DeleteTableSimulators < ActiveRecord::Migration[5.2]
  def change
    drop_table :simulators
  end
end
