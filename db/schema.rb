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

ActiveRecord::Schema.define(version: 20180131173353) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "domains", force: :cascade do |t|
    t.string "name"
    t.string "mountain_chain"
    t.boolean "is_sunny"
    t.string "forecast_data"
    t.integer "snow_depth_low"
    t.integer "snow_depth_high"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
    t.string "name_url"
    t.float "latitude"
    t.float "longitude"
    t.string "img_domain"
  end

  create_table "offers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "domain_id"
    t.string "flat_id_homeaway"
    t.string "flat_title"
    t.text "flat_photo"
    t.float "flat_price_by_night"
    t.float "flat_ratings"
    t.string "flat_location"
    t.string "car_id_drivy"
    t.float "car_price"
    t.string "car_title"
    t.text "car_photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "flat_bedrooms_nb"
    t.string "flat_url"
    t.string "car_url"
    t.index ["domain_id"], name: "index_offers_on_domain_id"
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "guests_number"
    t.string "checkin"
    t.string "checkout"
    t.string "start_city"
    t.bigint "domain_id"
    t.integer "total_price"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "drivy_data", default: "{}"
    t.jsonb "homeaway_data", default: "{}"
    t.integer "amount_cents", default: 0, null: false
    t.jsonb "payment"
    t.bigint "offer_id"
    t.index ["domain_id"], name: "index_orders_on_domain_id"
    t.index ["offer_id"], name: "index_orders_on_offer_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "facebook_picture_url"
    t.string "first_name"
    t.string "last_name"
    t.string "token"
    t.datetime "token_expiry"
    t.string "psid"
    t.jsonb "query", default: {}
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "offers", "domains"
  add_foreign_key "offers", "users"
  add_foreign_key "orders", "domains"
  add_foreign_key "orders", "offers"
  add_foreign_key "orders", "users"
end
