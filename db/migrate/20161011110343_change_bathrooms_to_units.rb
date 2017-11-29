class ChangeBathroomsToUnits < ActiveRecord::Migration
  def change
    change_column :units, :bathrooms, :decimal, precision: 10, scale: 1, null: false
  end
end
