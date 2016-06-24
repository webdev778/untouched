class MoveTypeToUnits < ActiveRecord::Migration
  def change
    remove_column :developments, :development_type
    add_column :units, :unit_type, :integer, default: 0, null: false
  end
end
