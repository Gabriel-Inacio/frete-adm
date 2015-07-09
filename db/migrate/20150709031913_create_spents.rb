class CreateSpents < ActiveRecord::Migration
  def change
    create_table :spents do |t|
      t.date :date_spent
      t.text :description
      t.decimal :value
      t.integer :truck_id

      t.timestamps
    end
  end
end
