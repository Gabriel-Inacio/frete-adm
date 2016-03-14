class CreateValleys < ActiveRecord::Migration
  def change
    create_table :valleys do |t|
      t.integer :motoristId
      t.decimal :value
      t.datetime :date
      t.boolean :status
      t.text :description
      t.timestamps
    end
  end
end
