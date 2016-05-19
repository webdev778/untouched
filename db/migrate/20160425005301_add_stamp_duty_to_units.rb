class AddStampDutyToUnits < ActiveRecord::Migration
  def change
    add_column :units, :stamp_duty, :decimal, default: 0, null: false
  end
end
