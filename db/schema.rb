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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111210150327) do

  create_table "deals", :force => true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.decimal  "price"
    t.integer  "quota"
    t.datetime "expiry_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "deals", ["item_id"], :name => "index_deals_on_item_id"
  add_index "deals", ["user_id"], :name => "index_deals_on_user_id"

  create_table "items", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lynks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "deal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lynks", ["deal_id"], :name => "index_lynks_on_deal_id"
  add_index "lynks", ["user_id"], :name => "index_lynks_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.boolean  "supplier",   :limit => 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end