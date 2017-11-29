class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.text :iframe, null: true
      t.integer :videoable_id, null: false
      t.string :videoable_type, null: false, limit: 255
      t.text :caption, null: true
      t.string :type, null: false, limit: 255
      t.integer :sort, default: 0, null: false

      t.timestamps null: false
    end

    add_index :videos, [ :videoable_id, :videoable_type ], unique: false
  end
end

