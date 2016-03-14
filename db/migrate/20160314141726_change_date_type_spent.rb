class ChangeDateTypeSpent < ActiveRecord::Migration
  def change
      change_column :spents, :date_spent, :date
  end
end
