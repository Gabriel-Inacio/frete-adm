class ChangeTypeDateSpent < ActiveRecord::Migration
  def change
    change_column :spents, :date_spent, :datetime
  end
end
