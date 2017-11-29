class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :file, null: false, limit: 255
      t.integer :imageable_id, null: false
      t.string :imageable_type, null: false, limit: 255
      t.string :caption, null: true, limit: 255

      t.timestamps null: false
    end

    add_index :images, [ :imageable_id, :imageable_type ], unique: false
  end
end
