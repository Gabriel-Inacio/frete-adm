class AddTruckIdToTransation < ActiveRecord::Migration
  def change
    add_column :transations, :truckId, :integer
  end
end
