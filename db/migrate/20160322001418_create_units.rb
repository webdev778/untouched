class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.decimal  "price",                    precision: 10, scale: 2, null: false
      t.integer  "bedrooms", null: false
      t.integer  "bathrooms", null: false
      t.integer  "parking", null: false
      t.decimal  "internal_in_meters",       precision: 10, scale: 1, null: false
      t.decimal  "master_bedroom_in_meters", precision: 10, scale: 1, null: true
      t.decimal  "external_in_meters",       precision: 10, scale: 1, null: true
      t.integer  "aspect", null: false
      t.boolean  "kitchen_island",                                   default: false, null: false
      t.boolean  "ensuite",                                          default: false, null: false
      t.boolean  "study_nook",                                       default: false, null: false
      t.boolean  "storage_cage",                                     default: false, null: false
      t.boolean  "walk_in_wardrobe",                                 default: false, null: false
      t.boolean  "bathtub",                                          default: false, null: false
      t.boolean  "penthouse_level",                                  default: false, null: false
      t.boolean  "no_stacker",                                       default: false, null: false
      t.decimal  "max_body_corporate_fee",   precision: 10, scale: 2, null: false
      t.integer  "development_id", null: false
      t.timestamps null: false

      t.index ["development_id"], name: "index_units_on_development_id", using: :btree, unique: false
    end
  end
end
