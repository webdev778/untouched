class ChangeColumnsToDevelopments < ActiveRecord::Migration
  def change
    add_column :developments, :developer_logo, :string, null: true, limit: 255
    rename_column  :developments, :logo, :development_logo
  end
end
