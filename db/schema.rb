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

ActiveRecord::Schema.define(version: 2020_08_09_080908) do

  create_table "addresses", force: :cascade do |t|
    t.integer "end_user_id", null: false
    t.string "postal_code", default: "", null: false
    t.string "address", default: "", null: false
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "bulletin_board_comments", force: :cascade do |t|
    t.integer "bulletin_board_id", null: false
    t.string "name", default: "", null: false
    t.text "comment", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bulletin_boards", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.string "name", default: "", null: false
    t.text "body", default: "", null: false
    t.string "delete_password", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.integer "end_user_id", null: false
    t.integer "product_id", null: false
    t.integer "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "charriages", force: :cascade do |t|
    t.string "area", default: "", null: false
    t.integer "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "end_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "family_name", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "kana_family_name", default: "", null: false
    t.string "kana_first_name", default: "", null: false
    t.string "postal_code", default: "", null: false
    t.text "address", default: "", null: false
    t.string "tel", default: "", null: false
    t.boolean "delete_status", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_end_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_end_users_on_reset_password_token", unique: true
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "end_user_id", null: false
    t.integer "product_id", null: false
    t.boolean "good_flag", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "product_id", null: false
    t.string "name", default: "", null: false
    t.integer "price", null: false
    t.integer "quantity", null: false
    t.integer "production_status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "end_user_id", null: false
    t.integer "charriage_id", null: false
    t.string "shipping_name", default: "", null: false
    t.string "postal_code", default: "", null: false
    t.string "shipping_address", default: "", null: false
    t.integer "total_quantity", null: false
    t.integer "billing_amount", null: false
    t.integer "status_flg", null: false
    t.integer "payment_flg", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_comments", force: :cascade do |t|
    t.integer "product_id", null: false
    t.string "name", default: "", null: false
    t.string "comment", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.integer "type_id", null: false
    t.text "introduction", default: "", null: false
    t.integer "price_excluding", null: false
    t.string "image_id", default: ""
    t.boolean "out_of_stock", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.boolean "invalid_status", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
