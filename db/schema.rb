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

ActiveRecord::Schema.define(version: 20130922100000) do

  create_table "assignments", force: true do |t|
    t.string   "name"
    t.date     "assigned_on"
    t.date     "due_on"
    t.integer  "klass_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assignments", ["klass_id"], name: "index_assignments_on_klass_id"

  create_table "klasses", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "klasses", ["user_id"], name: "index_klasses_on_user_id"

  create_table "problems", force: true do |t|
    t.text     "prompt"
    t.text     "latex"
    t.text     "notes"
    t.boolean  "completed",     default: false
    t.integer  "assignment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "label"
  end

  add_index "problems", ["assignment_id"], name: "index_problems_on_assignment_id"

  create_table "time_intervals", force: true do |t|
    t.datetime "start"
    t.datetime "end"
    t.integer  "problem_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "time_intervals", ["problem_id"], name: "index_time_intervals_on_problem_id"

  create_table "users", force: true do |t|
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

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
