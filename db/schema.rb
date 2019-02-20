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


ActiveRecord::Schema.define(version: 2019_02_20_083807) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.string "review"
    t.integer "rating"
    t.bigint "user_id"
    t.bigint "cabin_id"
    t.date "check_in"
    t.date "check_out"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number_of_people"
    t.index ["cabin_id"], name: "index_bookings_on_cabin_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "cabins", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "rating"
    t.integer "daily_rate"
    t.integer "max_people"
    t.string "picture"
    t.boolean "kitchen"
    t.boolean "lake"
    t.boolean "hot_water"
    t.boolean "wifi"
    t.boolean "available"
    t.string "address"
    t.boolean "beach"
    t.boolean "mountain"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.integer "capacity"
    t.index ["user_id"], name: "index_cabins_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.boolean "owner"
    t.string "email", default: "", null: false
    t.string "description"
    t.string "profile_pic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "cabins"
  add_foreign_key "bookings", "users"
  add_foreign_key "cabins", "users"
end
