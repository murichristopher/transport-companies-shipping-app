# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_26_211504) do
  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "carrier_vehicles", force: :cascade do |t|
    t.string "license_plate"
    t.string "brand"
    t.string "model"
    t.string "year"
    t.integer "maximum_load_capacity"
    t.integer "transport_company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_carrier_vehicles_on_slug", unique: true
    t.index ["transport_company_id"], name: "index_carrier_vehicles_on_transport_company_id"
  end

  create_table "delivery_times", force: :cascade do |t|
    t.integer "time"
    t.integer "transport_company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "km_min"
    t.integer "km_max"
    t.index ["transport_company_id"], name: "index_delivery_times_on_transport_company_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "prices", force: :cascade do |t|
    t.decimal "cubic_meters_min"
    t.decimal "cubic_meters_max"
    t.decimal "weight_min"
    t.decimal "value_per_km"
    t.integer "transport_company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "weight_max"
    t.string "slug"
    t.index ["slug"], name: "index_prices_on_slug", unique: true
    t.index ["transport_company_id"], name: "index_prices_on_transport_company_id"
  end

  create_table "transport_companies", force: :cascade do |t|
    t.string "trading_name"
    t.string "company_name"
    t.string "domain"
    t.string "registration_number"
    t.string "full_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 5
    t.string "slug"
    t.index ["slug"], name: "index_transport_companies_on_slug", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "transport_company_id"
    t.integer "user_type", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["transport_company_id"], name: "index_users_on_transport_company_id"
  end

  add_foreign_key "carrier_vehicles", "transport_companies"
  add_foreign_key "delivery_times", "transport_companies"
  add_foreign_key "prices", "transport_companies"
  add_foreign_key "users", "transport_companies"
end
