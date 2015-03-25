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

ActiveRecord::Schema.define(version: 20150323155329) do

  create_table "cities", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "state_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "iso2",         null: false
    t.string   "iso3",         null: false
    t.string   "capital_name"
    t.boolean  "enabled",      null: false
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
    t.date     "dob",             null: false
    t.string   "profile_picture"
    t.string   "nationality",     null: false
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
    t.integer  "currency_pair_id"
    t.integer  "rate_id"
    t.float    "fr_amount"
    t.float    "to_amount"
    t.integer  "customer_id"
    t.float    "rate_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
