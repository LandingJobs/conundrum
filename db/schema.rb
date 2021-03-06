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

ActiveRecord::Schema.define(version: 20131129152838) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "answers", force: true do |t|
    t.text     "answer_text",                 null: false
    t.boolean  "is_correct",  default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "question_id"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "authentications", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.string   "secret"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "authentications", ["user_id"], name: "index_authentications_on_user_id", using: :btree

  create_table "questions", force: true do |t|
    t.text     "question_text", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "skill_test_id"
  end

  add_index "questions", ["skill_test_id"], name: "index_questions_on_skill_test_id", using: :btree

  create_table "skill_tests", force: true do |t|
    t.string   "title",                     null: false
    t.text     "instructions",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "time_limit",   default: 15, null: false
  end

  create_table "submitted_answers", force: true do |t|
    t.integer  "test_run_id"
    t.integer  "question_id"
    t.integer  "question_number", null: false
    t.integer  "score",           null: false
    t.integer  "max_score",       null: false
    t.text     "wrong_answers"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "submitted_answers", ["question_id"], name: "index_submitted_answers_on_question_id", using: :btree
  add_index "submitted_answers", ["test_run_id"], name: "index_submitted_answers_on_test_run_id", using: :btree

  create_table "test_runs", force: true do |t|
    t.string   "email"
    t.integer  "skill_test_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "finished_at"
    t.float    "score"
    t.integer  "user_id"
  end

  add_index "test_runs", ["skill_test_id"], name: "index_test_runs_on_tech_test_id", using: :btree
  add_index "test_runs", ["user_id"], name: "index_test_runs_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",                            null: false
    t.string   "email",                           null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_url"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
