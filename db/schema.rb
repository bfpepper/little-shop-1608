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

ActiveRecord::Schema.define(version: 20161107150824) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "title"
  end

  create_table "orders", force: :cascade do |t|
    t.float    "cost"
    t.integer  "user_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "status",     default: "ordered"
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "orders_trips", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "trip_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "trip_price"
    t.index ["order_id"], name: "index_orders_trips_on_order_id", using: :btree
    t.index ["trip_id"], name: "index_orders_trips_on_trip_id", using: :btree
  end

  create_table "trips", force: :cascade do |t|
    t.string  "title"
    t.text    "description"
    t.string  "image_url"
    t.float   "price"
    t.integer "retired",     default: 0
    t.float   "latitude"
    t.float   "longitude"
    t.string  "address"
  end

  create_table "trips_categories", force: :cascade do |t|
    t.integer "trip_id"
    t.integer "category_id"
    t.index ["category_id"], name: "index_trips_categories_on_category_id", using: :btree
    t.index ["trip_id"], name: "index_trips_categories_on_trip_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "role",            default: 0
    t.string   "token"
  end

  add_foreign_key "orders", "users"
  add_foreign_key "orders_trips", "orders"
  add_foreign_key "orders_trips", "trips"
  add_foreign_key "trips_categories", "categories"
  add_foreign_key "trips_categories", "trips"
end
