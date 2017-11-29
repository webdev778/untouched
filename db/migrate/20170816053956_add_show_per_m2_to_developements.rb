class AddShowPerM2ToDevelopements < ActiveRecord::Migration
  def change
    add_column :developments, :show_per_m2, :boolean, default: false, null: false
  end
end
