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


ActiveRecord::Schema.define(version: 20150805143208) do

ActiveRecord::Schema.define(version: 20150708144400) do


  create_table "inventories", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "product_name"
    t.integer  "unit_price"
    t.integer  "selling_price"
    t.integer  "original_quantity"
    t.integer  "quantity_sold"
    t.integer  "quantity_left"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "product_name"
    t.integer  "selling_price"
    t.integer  "quantity_sold"
    t.string   "customer_name"
    t.string   "customer_add"
    t.integer  "customer_contact"
    t.string   "customer_email"
    t.string   "customer_payment"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.decimal  "total_price"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
  end
end
end