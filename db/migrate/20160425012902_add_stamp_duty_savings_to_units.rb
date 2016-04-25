class AddStampDutySavingsToUnits < ActiveRecord::Migration
  def change
    add_column :units, :stamp_duty_savings, :decimal, default: 0, null: false
  end
end
