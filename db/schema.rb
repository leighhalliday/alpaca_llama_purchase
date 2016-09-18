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

ActiveRecord::Schema.define(version: 20160918020620) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "llamas", force: :cascade do |t|
    t.string   "name",        null: false
    t.integer  "age",         null: false
    t.float    "weight_kg",   null: false
    t.integer  "price_cents", null: false
    t.text     "description", null: false
    t.string   "photo_url",   null: false
    t.integer  "order_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "subtotal_cents",                     null: false
    t.integer  "tax_cents",                          null: false
    t.integer  "shipping_cents",                     null: false
    t.integer  "total_cents",                        null: false
    t.float    "tax_rate",                           null: false
    t.string   "name",                               null: false
    t.string   "postal_code",                        null: false
    t.integer  "shipment_id"
    t.string   "status",         default: "initial", null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "shipments", force: :cascade do |t|
    t.string   "status",        default: "initial", null: false
    t.integer  "order_id",                          null: false
    t.string   "postal_code",                       null: false
    t.float    "weight_kg",                         null: false
    t.string   "shipper",                           null: false
    t.string   "service_level",                     null: false
    t.string   "tracking_code"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

end
