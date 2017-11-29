class AddLatLngToDevelopments < ActiveRecord::Migration
  def change
    add_column :developments, :lat, :float, null: true
    add_column :developments, :lng, :float, null: true
  end
end
