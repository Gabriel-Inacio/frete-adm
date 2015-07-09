class ChangeTypeData < ActiveRecord::Migration
  def change
  	change_column :transations, :dateTransation, :date
  end
end
