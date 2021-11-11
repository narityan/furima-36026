class RenameBuildingNumberColumnToAddresses < ActiveRecord::Migration[6.0]
  def change
    rename_column :addresses, :building_number, :building_name
  end
end
