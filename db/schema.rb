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

ActiveRecord::Schema.define(version: 20160111055302) do

  create_table "features", force: true do |t|
    t.string   "name"
    t.string   "problem_statement"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "features", ["project_id"], name: "index_features_on_project_id"

  create_table "personas", force: true do |t|
    t.string   "persona_name"
    t.string   "avatar"
    t.string   "location"
    t.string   "role_title"
    t.string   "quote"
    t.string   "uuid"
    t.text     "role_description"
    t.text     "demographics"
    t.text     "payload"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
    t.integer  "user_id"
  end

  add_index "personas", ["project_id"], name: "index_personas_on_project_id"
  add_index "personas", ["user_id"], name: "index_personas_on_user_id"

  create_table "projects", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "uuid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stories", force: true do |t|
    t.string   "type"
    t.string   "name"
    t.string   "description"
    t.boolean  "draft"
    t.string   "author"
    t.string   "uuid"
    t.integer  "user_id"
    t.text     "payload"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "feature_id"
  end

  add_index "stories", ["feature_id"], name: "index_stories_on_feature_id"

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "full_name"
    t.boolean  "admin"
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
