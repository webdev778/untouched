class AddAnnualCouncilRateToUnits < ActiveRecord::Migration
  def change
    add_column :units, :annual_council_rate, :decimal, default: 0, null: false
  end
end
