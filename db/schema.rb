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

ActiveRecord::Schema.define(version: 20160427022725) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "available_times", force: :cascade do |t|
    t.string   "alias"
    t.string   "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "room"
    t.integer  "recursers_id"
    t.string   "topic"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "available_time_id"
  end

  add_index "groups", ["available_time_id"], name: "index_groups_on_available_time_id", using: :btree
  add_index "groups", ["recursers_id"], name: "index_groups_on_recursers_id", using: :btree

  create_table "recursers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "group_id"
    t.string   "zulip_email"
  end

  add_index "recursers", ["group_id"], name: "index_recursers_on_group_id", using: :btree

  add_foreign_key "groups", "available_times"
end
