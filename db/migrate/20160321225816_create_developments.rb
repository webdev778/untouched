class CreateDevelopments < ActiveRecord::Migration
  def change
    create_table :developments do |t|
      t.string :city, null: false, limit: 255
      t.string :region, null: false, limit: 255
      t.string :suburb, null: true, limit: 255
      t.date :ready_at, null: true
      t.boolean :has_gym, default: false, null: false
      t.boolean :has_pool, default: false, null: false
      t.boolean :has_spa, default: false, null: false
      t.boolean :has_sauna, default: false, null: false
      t.boolean :has_steam_room, default: false, null: false
      t.boolean :has_rooftop_deck, default: false, null: false
      t.boolean :has_double_glazed_windows, default: false, null: false
      t.decimal :ceiling_height_at_living_area_in_meters, precision: 5, scale: 1, null: false

      t.timestamps null: false
    end
  end
end
