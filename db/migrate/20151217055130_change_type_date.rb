class ChangeTypeDate < ActiveRecord::Migration
  def change
    change_column :freights, :exitDate, :date
    change_column :freights, :arrivalDate, :date
  end
end
