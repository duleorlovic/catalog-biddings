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

ActiveRecord::Schema.define(version: 20151016112233) do

  create_table "catalog_auctions", force: :cascade do |t|
    t.integer  "catalog_id"
    t.float    "initial_price"
    t.boolean  "is_active"
    t.datetime "expires_at"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "catalog_auctions", ["catalog_id"], name: "index_catalog_auctions_on_catalog_id"

  create_table "catalog_biddings", force: :cascade do |t|
    t.integer  "catalog_auction_id"
    t.integer  "user_id"
    t.float    "offered_price"
    t.datetime "offered_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "catalog_biddings", ["catalog_auction_id"], name: "index_catalog_biddings_on_catalog_auction_id"
  add_index "catalog_biddings", ["user_id"], name: "index_catalog_biddings_on_user_id"

  create_table "catalogs", force: :cascade do |t|
    t.string   "title"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
