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

ActiveRecord::Schema.define(version: 20180101131646) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "name"
    t.integer "mobile_no"
    t.text "house_no"
    t.text "street"
    t.text "landmark"
    t.text "city"
    t.text "state"
    t.bigint "order_id"
    t.bigint "user_id"
    t.index ["order_id"], name: "index_addresses_on_order_id"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "carts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean "completed", default: false
    t.bigint "user_id"
    t.float "total", limit: 24, default: 0.0
    t.bigint "order_id"
    t.index ["order_id"], name: "index_carts_on_order_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "line_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "cart_id"
    t.bigint "product_id"
    t.decimal "price", precision: 10
    t.integer "discount"
    t.integer "quantity", default: 0
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["product_id"], name: "index_line_items_on_product_id"
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "payment_type"
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "color"
    t.integer "price"
    t.integer "discount"
    t.text "description"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.float "rating", limit: 24
    t.integer "rating_factor"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "username"
    t.string "email"
    t.string "password"
    t.boolean "super_admin"
    t.boolean "admin"
  end

  add_foreign_key "addresses", "orders"
  add_foreign_key "addresses", "users"
  add_foreign_key "carts", "orders"
  add_foreign_key "carts", "users"
  add_foreign_key "line_items", "carts"
  add_foreign_key "line_items", "products"
end
