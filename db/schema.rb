# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161113214550) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "developments", force: :cascade do |t|
    t.string   "city",                      limit: 255,                 null: false
    t.date     "ready_at"
    t.boolean  "gym",                                   default: false, null: false
    t.boolean  "pool",                                  default: false, null: false
    t.boolean  "spa",                                   default: false, null: false
    t.boolean  "sauna",                                 default: false, null: false
    t.boolean  "steam_room",                            default: false, null: false
    t.boolean  "rooftop_deck",                          default: false, null: false
    t.boolean  "has_double_glazed_windows",             default: false, null: false
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.string   "photo",                     limit: 255
    t.integer  "units_count",                           default: 0,     null: false
    t.string   "address",                   limit: 255,                 null: false
    t.integer  "suburb_id",                                             null: false
    t.float    "lat"
    t.float    "lng"
    t.decimal  "deposit_percent",                       default: 0.0,   null: false
    t.integer  "deposit_due_in_days",                   default: 0,     null: false
    t.string   "contract",                  limit: 255
    t.string   "logo",                      limit: 255
    t.boolean  "private",                               default: false, null: false
    t.string   "intercom_app_id",           limit: 255
  end

  add_index "developments", ["suburb_id"], name: "index_developments_on_suburb_id", using: :btree

  create_table "enquiries", force: :cascade do |t|
    t.string   "name",       limit: 255,                 null: false
    t.string   "email",      limit: 255,                 null: false
    t.text     "body",                                   null: false
    t.boolean  "mortgage",               default: false, null: false
    t.integer  "unit_id",                                null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "file",           limit: 255,             null: false
    t.integer  "imageable_id",                           null: false
    t.string   "imageable_type", limit: 255,             null: false
    t.text     "caption"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "type",           limit: 255,             null: false
    t.integer  "sort",                       default: 0, null: false
  end

  add_index "images", ["imageable_id", "imageable_type"], name: "index_images_on_imageable_id_and_imageable_type", using: :btree

  create_table "impressions", force: :cascade do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.text     "params"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "params"], name: "poly_params_request_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index", using: :btree
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id", using: :btree

  create_table "regions", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "suburbs", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.integer  "region_id",              null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "suburbs", ["region_id"], name: "index_suburbs_on_region_id", using: :btree

  create_table "units", force: :cascade do |t|
    t.decimal  "price",                               precision: 10, scale: 2,                 null: false
    t.integer  "bedrooms",                                                                     null: false
    t.decimal  "bathrooms",                           precision: 10, scale: 1,                 null: false
    t.integer  "parking",                                                                      null: false
    t.decimal  "internal_in_meters",                  precision: 10, scale: 1,                 null: false
    t.decimal  "master_bedroom_in_meters",            precision: 10, scale: 1
    t.decimal  "external_in_meters",                  precision: 10, scale: 1
    t.integer  "aspect",                                                                       null: false
    t.boolean  "kitchen_island",                                               default: false, null: false
    t.boolean  "study_nook",                                                   default: false, null: false
    t.boolean  "storage_cage",                                                 default: false, null: false
    t.boolean  "no_stacker",                                                   default: false, null: false
    t.decimal  "max_body_corporate_fee",              precision: 10, scale: 2,                 null: false
    t.integer  "development_id",                                                               null: false
    t.datetime "created_at",                                                                   null: false
    t.datetime "updated_at",                                                                   null: false
    t.integer  "status",                                                       default: 0,     null: false
    t.string   "number",                   limit: 10,                                          null: false
    t.decimal  "stamp_duty",                                                   default: 0.0,   null: false
    t.decimal  "stamp_duty_savings",                                           default: 0.0,   null: false
    t.decimal  "annual_council_rate",                                          default: 0.0,   null: false
    t.integer  "unit_type",                                                    default: 0,     null: false
    t.boolean  "study_room",                                                   default: false, null: false
    t.decimal  "water_rates",                                                  default: 0.0,   null: false
  end

  add_index "units", ["development_id"], name: "index_units_on_development_id", using: :btree

  create_table "videos", force: :cascade do |t|
    t.text     "iframe"
    t.integer  "videoable_id",                           null: false
    t.string   "videoable_type", limit: 255,             null: false
    t.text     "caption"
    t.string   "type",           limit: 255,             null: false
    t.integer  "sort",                       default: 0, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "videos", ["videoable_id", "videoable_type"], name: "index_videos_on_videoable_id_and_videoable_type", using: :btree

  add_foreign_key "developments", "suburbs"
  add_foreign_key "suburbs", "regions"
end
