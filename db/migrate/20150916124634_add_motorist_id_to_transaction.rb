class AddMotoristIdToTransaction < ActiveRecord::Migration
  def change
    add_column :transations, :motoristId, :integer
  end
end
