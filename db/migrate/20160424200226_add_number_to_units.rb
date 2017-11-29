class AddNumberToUnits < ActiveRecord::Migration
  def change
    add_column :units, :number, :string, null: false, limit: 10
  end
end
