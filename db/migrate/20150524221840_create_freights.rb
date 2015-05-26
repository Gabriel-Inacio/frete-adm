class CreateFreights < ActiveRecord::Migration
  def change
    create_table :freights do |t|
      t.integer :truckId
      t.integer :motoristId
      t.integer :clientId
      t.string :origin
      t.string :destination
      t.decimal :valueKm
      t.decimal :distanceKm
      t.text :description
      t.integer :situation
      t.decimal :spent
      t.text :descriptionSpent
      t.integer :numberHead
      t.datetime :exitDate
      t.datetime :arrivalDate
      t.boolean :paidDriver

      t.timestamps
    end
  end
end
