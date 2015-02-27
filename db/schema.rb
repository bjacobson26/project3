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

ActiveRecord::Schema.define(version: 20150227000533) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "painting"
    t.string   "sculpture"
    t.string   "furniture"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_details", force: true do |t|
    t.string   "name"
    t.integer  "quantity"
    t.decimal  "price"
    t.decimal  "tax"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
    t.integer  "product_id"
  end

  add_index "order_details", ["order_id"], name: "index_order_details_on_order_id", using: :btree
  add_index "order_details", ["product_id"], name: "index_order_details_on_product_id", using: :btree

  create_table "orders", force: true do |t|
    t.date     "order_date"
    t.decimal  "shipping_price"
    t.decimal  "subtotal"
    t.decimal  "total"
    t.boolean  "is_completed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tracking_number"
    t.integer  "user_id"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "product_images", force: true do |t|
    t.string   "image_file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.decimal  "unit_price"
    t.integer  "quantity"
    t.boolean  "in_stock"
    t.text     "description"
    t.float    "height"
    t.float    "weight"
    t.float    "width"
    t.float    "depth"
    t.string   "material"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_taxable"
    t.integer  "product_image_id"
    t.boolean  "indoor"
    t.integer  "category_id"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["product_image_id"], name: "index_products_on_product_image_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.string   "country"
    t.string   "phone"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
