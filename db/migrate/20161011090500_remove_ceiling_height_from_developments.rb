class RemoveCeilingHeightFromDevelopments < ActiveRecord::Migration
  def change
    remove_column :developments, :ceiling_height_at_living_area_in_meters
  end
end
