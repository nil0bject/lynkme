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

ActiveRecord::Schema.define(:version => 20111217044413) do

  create_table "deals", :force => true do |t|
    t.integer  "item_id"
    t.integer  "user_id"
    t.decimal  "price",       :precision => 10, :scale => 0
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
    t.integer  "deal_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lynks", ["deal_id"], :name => "index_lynks_on_deal_id"
  add_index "lynks", ["user_id"], :name => "index_lynks_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "supplier"
    t.string   "session_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
