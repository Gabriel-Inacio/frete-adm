class FixNameType < ActiveRecord::Migration
  def change
    rename_column :People, :type, :type_person
  end
end
