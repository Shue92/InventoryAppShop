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

ActiveRecord::Schema.define(version: 20150813105243) do

  create_table "orders", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "product_name"
    t.decimal  "selling_price"
    t.integer  "quantity_sold"
    t.string   "customer_name"
    t.string   "customer_add"
    t.integer  "customer_contact"
    t.boolean  "customer_payment"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.decimal  "total_price"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.text     "description"
    t.integer  "quantity"
    t.boolean  "shipping"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "product_image"
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
