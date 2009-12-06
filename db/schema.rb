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

ActiveRecord::Schema.define(:version => 20091206100302) do

  create_table "anketas", :force => true do |t|
    t.string   "title"
    t.string   "code"
    t.text     "description"
    t.integer  "poll_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "answers", :force => true do |t|
    t.text     "body"
    t.integer  "question_id"
    t.integer  "result_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "polls", :force => true do |t|
    t.string   "title"
    t.string   "branch"
    t.string   "location"
    t.string   "state",       :default => "draft"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.string   "qtype",      :default => "text"
    t.text     "body"
    t.text     "variants"
    t.boolean  "mandatory",  :default => false
    t.integer  "anketa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "responders", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "father_name"
    t.string   "email"
    t.string   "sex"
    t.string   "city"
    t.string   "address"
    t.string   "aducation"
    t.string   "phone"
    t.date     "birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "results", :force => true do |t|
    t.integer  "anketa_id"
    t.integer  "responder_id"
    t.integer  "percentage"
    t.string   "responder_ip"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "role",                                     :default => "user"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
