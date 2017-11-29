class RemoveResidenceFieldsToUnits < ActiveRecord::Migration
  def change
    remove_column :units, :ensuite
    remove_column :units, :walk_in_wardrobe
    remove_column :units, :bathtub
    remove_column :units, :penthouse_level
  end
end
