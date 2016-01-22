class CreatePaidMotorists < ActiveRecord::Migration
  def change
    create_table :paid_motorists do |t|
      t.text :description
      t.decimal :value
      t.datetime :date
      t.integer :truckId
      t.integer :motoristId
      t.timestamps
    end
  end
end
