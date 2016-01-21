class AddDateToFreights < ActiveRecord::Migration
  def change
    add_column :freights, :receipt_date, :date
  end
end
