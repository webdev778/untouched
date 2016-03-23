class AddPhotoToDevelopments < ActiveRecord::Migration
  def change
    add_column :developments, :photo, :string, limit: 255, null: true
  end
end
