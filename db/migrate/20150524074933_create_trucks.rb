class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.string :board
      t.integer :year
      t.integer :axes

      t.timestamps
    end
  end
end
