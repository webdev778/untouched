class AddStudyRoomToUnits < ActiveRecord::Migration
  def change
    add_column :units, :study_room, :boolean, default: false, null: false
  end
end
