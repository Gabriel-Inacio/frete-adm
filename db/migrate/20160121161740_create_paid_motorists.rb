class CreatePaidMotorists < ActiveRecord::Migration
  def change
    create_table :paid_motorists do |t|

      t.timestamps
    end
  end
end
