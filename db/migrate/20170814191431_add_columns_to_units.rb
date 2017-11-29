class AddColumnsToUnits < ActiveRecord::Migration
  def change
    add_column :units, :car_park_lot, :string, null: false, default: "", limit: 255
    add_column :units, :storage_lot, :string, null: false, default: "", limit: 255
  end
end
