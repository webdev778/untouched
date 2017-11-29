class AddWaterRatesToUnits < ActiveRecord::Migration
  def change
    add_column :units, :water_rates, :decimal, default: 0, null: false
  end
end
