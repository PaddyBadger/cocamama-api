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

ActiveRecord::Schema.define(version: 20160217125349) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "goal_templates", force: :cascade do |t|
    t.string   "title",       default: ""
    t.string   "description", default: ""
    t.integer  "category",    default: 0
    t.boolean  "published",   default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "icon"
  end

  create_table "goals", force: :cascade do |t|
    t.string   "title",       default: ""
    t.string   "description", default: ""
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer  "category",    default: 0
    t.integer  "frequency",   default: 0
    t.integer  "count",       default: 0
    t.string   "type"
    t.string   "icon"
  end

  add_index "goals", ["user_id"], name: "index_goals_on_user_id", using: :btree

  create_table "icons", force: :cascade do |t|
    t.string   "name",       default: ""
    t.string   "keywords",   default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "participation_trackers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "goal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "participation_trackers", ["goal_id"], name: "index_participation_trackers_on_goal_id", using: :btree

  create_table "steps", force: :cascade do |t|
    t.datetime "day"
    t.boolean  "completed"
    t.integer  "participation_tracker_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "steps", ["participation_tracker_id"], name: "index_steps_on_participation_tracker_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "auth_token",             default: ""
    t.string   "name",                   default: ""
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
