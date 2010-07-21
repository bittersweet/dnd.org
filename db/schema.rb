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

ActiveRecord::Schema.define(:version => 20100721182036) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "artists", :force => true do |t|
    t.string   "name"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "section",             :default => 0, :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.string   "avatar_file_size"
  end

  add_index "artists", ["section"], :name => "index_artists_on_section"

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "statistics", :force => true do |t|
    t.integer  "track_id"
    t.string   "ip"
    t.string   "browser"
    t.datetime "played_at"
  end

  create_table "tracks", :force => true do |t|
    t.string   "name"
    t.integer  "artist_id"
    t.string   "mp3_file_name"
    t.string   "mp3_content_type"
    t.string   "mp3_file_size"
    t.string   "description"
    t.integer  "statistics_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "length"
    t.integer  "section",          :default => 0, :null => false
    t.string   "artistlink"
    t.string   "buylink"
  end

  add_index "tracks", ["section"], :name => "index_tracks_on_section"

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
