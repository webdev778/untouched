class CreateSuburbs < ActiveRecord::Migration
  def change
    create_table :suburbs do |t|
      t.string :name, limit: 255, null: false
      t.references :region, null: false, foreign_key: true

      t.timestamps null: false
    end

    add_index :suburbs, :region_id, unique: false
  end
end
