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

ActiveRecord::Schema[8.0].define(version: 2025_09_30_200203) do
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

  create_table "connected_accounts", force: :cascade do |t|
    t.string "pid", default: "", null: false
    t.string "type"
    t.bigint "user_id", null: false
    t.string "external_id", null: false
    t.jsonb "metadata", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pid"], name: "index_connected_accounts_on_pid", unique: true
    t.index ["type", "user_id", "external_id"], name: "index_connected_accounts_on_type_and_user_id_and_external_id", unique: true
    t.index ["user_id"], name: "index_connected_accounts_on_user_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "pid", default: "", null: false
    t.bigint "user_id", null: false
    t.integer "document_type", default: 0
    t.string "document", null: false
    t.string "country_code", null: false
    t.string "phone", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pid"], name: "index_customers_on_pid", unique: true
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.string "pid", default: "", null: false
    t.bigint "order_id", null: false
    t.bigint "product_variant_id", null: false
    t.integer "quantity", default: 1, null: false
    t.decimal "unit_price", default: "0.0", null: false
    t.decimal "discount", default: "0.0", null: false
    t.virtual "subtotal", type: :decimal, as: "((quantity)::numeric * unit_price)", stored: true
    t.virtual "total", type: :decimal, as: "(((quantity)::numeric * unit_price) - discount)", stored: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["pid"], name: "index_order_items_on_pid", unique: true
    t.index ["product_variant_id"], name: "index_order_items_on_product_variant_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "pid", default: "", null: false
    t.bigint "customer_id", null: false
    t.bigint "company_id", null: false
    t.bigint "user_id"
    t.integer "status", default: 0, null: false
    t.string "currency", default: "BRL", null: false
    t.date "due_date"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_orders_on_company_id"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["pid"], name: "index_orders_on_pid", unique: true
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payment_attempts", force: :cascade do |t|
    t.bigint "payment_id", null: false
    t.string "payment_intent_id"
    t.jsonb "payload"
    t.datetime "requested_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_id"], name: "index_payment_attempts_on_payment_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "pid", default: "", null: false
    t.bigint "order_id", null: false
    t.integer "status", default: 0, null: false
    t.decimal "total", default: "0.0", null: false
    t.integer "gateway_type", default: 0, null: false
    t.string "gateway_payment_id"
    t.datetime "paid_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_payments_on_order_id"
    t.index ["pid"], name: "index_payments_on_pid", unique: true
  end

  create_table "product_variants", force: :cascade do |t|
    t.string "pid", default: "", null: false
    t.bigint "product_id", null: false
    t.string "title", null: false
    t.decimal "price", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pid"], name: "index_product_variants_on_pid", unique: true
    t.index ["product_id"], name: "index_product_variants_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "pid", default: "", null: false
    t.bigint "company_id", null: false
    t.bigint "category_id"
    t.string "title", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id", "title"], name: "index_products_on_category_id_and_title", unique: true
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["company_id"], name: "index_products_on_company_id"
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
  add_foreign_key "connected_accounts", "users"
  add_foreign_key "customers", "users"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "product_variants"
  add_foreign_key "orders", "companies"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "users"
  add_foreign_key "payment_attempts", "payments"
  add_foreign_key "payments", "orders"
  add_foreign_key "product_variants", "products"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "companies"
  add_foreign_key "sessions", "users"
end
