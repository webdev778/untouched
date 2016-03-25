class AddDevelopmentTypeToDevelopments < ActiveRecord::Migration
  def change
    add_column :developments, :development_type, :integer, null: false, default: 0
  end
end
