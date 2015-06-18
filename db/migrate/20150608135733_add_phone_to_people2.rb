class AddPhoneToPeople2 < ActiveRecord::Migration
  def change
    add_column :people, :phone, :string
  end
end
