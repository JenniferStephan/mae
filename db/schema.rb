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

ActiveRecord::Schema.define(version: 2019_08_28_130035) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "email"
    t.string "company_name"
    t.text "company_address"
    t.string "company_siret"
    t.string "category"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.string "title"
    t.string "reference"
    t.date "creation_date"
    t.date "due_date"
    t.date "payment_date"
    t.float "total_amount_ht"
    t.float "total_amount_ttc"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.bigint "client_id"
    t.text "comment"
    t.index ["client_id"], name: "index_invoices_on_client_id"
    t.index ["user_id"], name: "index_invoices_on_user_id"
  end

  create_table "missions", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_missions_on_user_id"
  end

  create_table "missions_invoices", force: :cascade do |t|
    t.integer "man_day_quantity"
    t.integer "price_rate"
    t.integer "vat_rate"
    t.bigint "mission_id"
    t.bigint "invoice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_missions_invoices_on_invoice_id"
    t.index ["mission_id"], name: "index_missions_invoices_on_mission_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "category"
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "siret"
    t.string "profession"
    t.integer "vat"
    t.string "address"
    t.string "phone_number"
    t.string "entreprise_name"
    t.string "website_url"
    t.float "tax_rate", default: 0.22
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "clients", "users"
  add_foreign_key "invoices", "clients"
  add_foreign_key "invoices", "users"
  add_foreign_key "missions", "users"
  add_foreign_key "missions_invoices", "invoices"
  add_foreign_key "missions_invoices", "missions"
  add_foreign_key "notifications", "users"
end
