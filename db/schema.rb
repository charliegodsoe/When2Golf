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

ActiveRecord::Schema.define(:version => 20101119040249) do

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses_time_display_formats", :id => false, :force => true do |t|
    t.integer "course_id"
    t.integer "time_display_format_id"
  end

  create_table "courses_users", :id => false, :force => true do |t|
    t.integer "course_id"
    t.integer "user_id"
  end

  create_table "time_display_formats", :force => true do |t|
    t.string   "format_name"
    t.integer  "time_display_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "time_display_types", :force => true do |t|
    t.string   "type_name"
    t.string   "type_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "time_entries", :force => true do |t|
    t.integer  "course_id"
    t.datetime "start_date_time"
    t.datetime "end_date_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "time_entry_qualities", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "time_in_minutes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "display_name"
  end

  create_table "time_format_groups", :force => true do |t|
    t.integer  "time_display_format_id"
    t.string   "group_name"
    t.string   "group_display_name"
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_roles", :force => true do |t|
    t.string   "role"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.integer  "user_role_id",       :default => 3
    t.string   "encrypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
