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

ActiveRecord::Schema.define(version: 20150402114755) do

  create_table "cities", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "state_id",   null: false
    t.integer  "country_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "iso2",         null: false
    t.string   "iso3",         null: false
    t.string   "capital_name"
    t.boolean  "enabled",      null: false
    t.string   "nationality"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "currencies", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "iso",             null: false
    t.string   "base_unit_one"
    t.string   "base_unit_other"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "currency_pairs", force: :cascade do |t|
    t.integer  "fr_currency_id", null: false
    t.integer  "to_currency_id", null: false
    t.string   "ccy_pair_iso",   null: false
    t.string   "ccy_pair_name",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: :cascade do |t|
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "sex",             null: false
    t.string   "dob",             null: false
    t.string   "profile_picture"
    t.integer  "country_id",      null: false
    t.string   "country_name",    null: false
    t.string   "email",           null: false
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rates", force: :cascade do |t|
    t.float    "rate",             null: false
    t.integer  "currency_pair_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", force: :cascade do |t|
    t.string   "name",         null: false
    t.integer  "country_id",   null: false
    t.string   "iso"
    t.string   "capital_name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "currency_pair_id", null: false
    t.integer  "rate_id",          null: false
    t.float    "fr_amount",        null: false
    t.float    "to_amount",        null: false
    t.integer  "customer_id",      null: false
    t.float    "rate_value",       null: false
    t.integer  "user_id",          null: false
    t.integer  "fr_ccy_id",        null: false
    t.integer  "to_ccy_id",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.boolean  "admin"
    t.string   "phone"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"

end
