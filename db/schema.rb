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

ActiveRecord::Schema.define(version: 20150428182619) do

  create_table "questions", force: :cascade do |t|
    t.string   "question"
    t.string   "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "vocable_id"
    t.integer  "quiz_id"
  end

  add_index "questions", ["quiz_id"], name: "index_questions_on_quiz_id"
  add_index "questions", ["vocable_id"], name: "index_questions_on_vocable_id"

  create_table "quizzes", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "unit_subscription_id"
  end

  add_index "quizzes", ["unit_subscription_id"], name: "index_quizzes_on_unit_subscription_id_id"

  create_table "tests", force: :cascade do |t|
    t.integer  "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "units_id"
  end

  add_index "tests", ["units_id"], name: "index_tests_on_units_id"

  create_table "unit_subscriptions", force: :cascade do |t|
    t.integer  "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "unit_id"
  end

  add_index "unit_subscriptions", ["unit_id"], name: "index_unit_subscriptions_on_unit_id"
  add_index "unit_subscriptions", ["user_id"], name: "index_unit_subscriptions_on_user_id"

  create_table "units", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "vocables", force: :cascade do |t|
    t.string   "german"
    t.string   "english"
    t.string   "swedish"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "unit_id"
  end

  add_index "vocables", ["unit_id"], name: "index_vocables_on_unit_id"

end
