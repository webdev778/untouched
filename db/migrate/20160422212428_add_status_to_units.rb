class AddStatusToUnits < ActiveRecord::Migration
  def change
    add_column :units, :status, :integer, default: 0, null: false
  end
end
