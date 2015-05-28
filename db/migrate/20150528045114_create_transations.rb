class CreateTransations < ActiveRecord::Migration
  def change
    create_table :transations do |t|
      t.string :objectName
      t.integer :objectId
      t.text :description
      t.decimal :value
      t.datetime :dateTransation

      t.timestamps
    end
  end
end
