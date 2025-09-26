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

ActiveRecord::Schema[8.0].define(version: 2025_09_24_020053) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "addressable_type", null: false
    t.bigint "addressable_id", null: false
    t.string "country", default: "PT"
    t.string "zip_code"
    t.string "street_name"
    t.string "building_number"
    t.string "district"
    t.string "city"
    t.string "state"
    t.string "complement"
    t.decimal "latitude"
    t.decimal "longitude"
    t.string "reference"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable"
  end

  create_table "categories", force: :cascade do |t|
    t.string "pid", default: "", null: false
    t.bigint "company_id", null: false
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id", "title"], name: "index_categories_on_company_id_and_title", unique: true
    t.index ["company_id"], name: "index_categories_on_company_id"
    t.index ["pid"], name: "index_categories_on_pid", unique: true
  end

  create_table "companies", force: :cascade do |t|
    t.string "pid", default: "", null: false
    t.string "name", null: false
    t.string "nif"
    t.integer "industry", default: 0
    t.datetime "disabled_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_companies_on_name", unique: true
    t.index ["pid"], name: "index_companies_on_pid", unique: true
  end

  create_table "company_users", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id", "user_id"], name: "index_company_users_on_company_id_and_user_id", unique: true
    t.index ["company_id"], name: "index_company_users_on_company_id"
    t.index ["user_id"], name: "index_company_users_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "pid", default: "", null: false
    t.bigint "category_id", null: false
    t.string "title", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id", "title"], name: "index_products_on_category_id_and_title", unique: true
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["pid"], name: "index_products_on_pid", unique: true
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "pid", default: "", null: false
    t.string "name", null: false
    t.integer "role", default: 0, null: false
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "disabled_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
    t.index ["pid"], name: "index_users_on_pid", unique: true
  end

  add_foreign_key "categories", "companies"
  add_foreign_key "company_users", "companies"
  add_foreign_key "company_users", "users"
  add_foreign_key "products", "categories"
  add_foreign_key "sessions", "users"
end
