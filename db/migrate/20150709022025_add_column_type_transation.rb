class AddColumnTypeTransation < ActiveRecord::Migration
  def change
  	add_column :transations, :type_transation, :boolean
  end
end
