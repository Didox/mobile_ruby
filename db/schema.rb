# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090220195140) do

  create_table "full_banners", :force => true do |t|
    t.string   "name"
    t.string   "file"
    t.string   "link"
    t.datetime "date_begin"
    t.datetime "date_end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups_pages", :force => true do |t|
    t.integer "group_id"
    t.integer "page_id"
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.string   "link"
    t.text     "obs"
    t.integer  "position"
    t.integer  "parent_id"
    t.string   "color"
    t.boolean  "title_visibility"
    t.boolean  "publish"
    t.boolean  "restricted"
    t.boolean  "is_menu"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages_popups", :force => true do |t|
    t.integer "popups_id"
    t.integer "page_id"
  end

  create_table "popups", :force => true do |t|
    t.string   "name"
    t.string   "file"
    t.string   "link"
    t.integer  "width"
    t.integer  "height"
    t.datetime "date_begin"
    t.datetime "date_end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "login"
    t.string   "password"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
