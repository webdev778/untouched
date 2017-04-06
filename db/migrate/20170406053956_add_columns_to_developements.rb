class AddColumnsToDevelopements < ActiveRecord::Migration
  def change
    add_column :developments, :show_on_home_page, :boolean, default: false, null: false
  end
end
