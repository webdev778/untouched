class AddLogoToDevelopments < ActiveRecord::Migration
  def change
    add_column :developments, :logo, :string, null: true, limit: 255
  end
end
