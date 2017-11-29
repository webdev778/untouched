class AddTypeToImages < ActiveRecord::Migration
  def change
    add_column :images, :type, :string, null: false, limit: 255
  end
end
