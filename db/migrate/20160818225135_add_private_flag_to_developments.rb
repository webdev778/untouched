class AddPrivateFlagToDevelopments < ActiveRecord::Migration
  def change
    add_column :developments, :private, :boolean, default: false, null: false
  end
end
