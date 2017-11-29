class AddAddressToDevelopments < ActiveRecord::Migration
  def change
    add_column :developments, :address, :string, null: false, limit: 255
  end
end
