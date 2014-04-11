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

ActiveRecord::Schema.define(version: 20140411172848) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "instagram_photos", force: true do |t|
    t.string   "tags",              array: true
    t.float    "lat"
    t.float    "lng"
    t.string   "created_time"
    t.string   "link"
    t.string   "img_url_thumb"
    t.string   "img_url_low"
    t.string   "img_url_standard"
    t.text     "caption"
    t.string   "users_in_photo",    array: true
    t.string   "instagram_user"
    t.string   "instagram_user_id"
    t.string   "instagram_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tour_id"
  end

  add_index "instagram_photos", ["instagram_id"], name: "index_instagram_photos_on_instagram_id", unique: true, using: :btree

  create_table "locations", force: true do |t|
    t.float    "lng"
    t.float    "lat"
    t.datetime "located_at"
    t.string   "reverse"
    t.integer  "tour_id"
  end

  create_table "tour_dates", force: true do |t|
    t.date     "date"
    t.string   "city_state"
    t.string   "venue"
    t.string   "map_query"
    t.string   "ticket_url"
    t.string   "facebook_url"
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tour_id"
  end

  create_table "tours", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "tour_image"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_token"
    t.string   "band_name"
    t.string   "band_slug"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
