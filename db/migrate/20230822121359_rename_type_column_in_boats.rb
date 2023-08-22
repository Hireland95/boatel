class RenameTypeColumnInBoats < ActiveRecord::Migration[6.0]
  def change
    rename_column :boats, :type, :boat_type
  end
end
