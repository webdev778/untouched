class AddSortToImages < ActiveRecord::Migration
  def change
    add_column :images, :sort, :integer, default: 0, null: false
  end
end
