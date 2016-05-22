class ChangeImageCaptionsToText < ActiveRecord::Migration
  def change
    change_column :images, :caption, :text, null: true
  end
end
