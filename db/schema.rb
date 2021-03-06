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

ActiveRecord::Schema.define(:version => 20141107102150) do

  create_table "authorizations", :force => true do |t|
    t.string   "email"
    t.string   "authorization_key"
    t.boolean  "authorized"
    t.integer  "purchase_order_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "sender_email"
  end

  create_table "line_items", :force => true do |t|
    t.text     "description",       :limit => 255
    t.integer  "quantity"
    t.integer  "tax_rate"
    t.decimal  "price"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "purchase_order_id"
  end

  create_table "notes", :force => true do |t|
    t.text     "content"
    t.integer  "purchase_order_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "notes", ["purchase_order_id"], :name => "index_notes_on_purchase_order_id"

  create_table "purchase_orders", :force => true do |t|
    t.integer  "number"
    t.string   "budget"
    t.string   "raised_by"
    t.string   "your_company_name"
    t.text     "delivery_address"
    t.string   "supplier_name"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "status"
    t.string   "conversation_key"
    t.string   "phone_number"
    t.text     "note"
    t.string   "email"
    t.text     "date"
  end

end
