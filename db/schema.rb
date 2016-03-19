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

ActiveRecord::Schema.define(version: 0) do

  create_table "activities", force: :cascade do |t|
    t.string "name"
  end

  create_table "calendar_events", force: :cascade do |t|
    t.string  "start_time"
    t.string  "end_time"
    t.integer "user_id"
    t.integer "patient_id"
    t.integer "activity_id"
    t.string  "date"
  end

  add_index "calendar_events", ["activity_id"], name: "index_calendar_events_on_activity_id"
  add_index "calendar_events", ["patient_id"], name: "index_calendar_events_on_patient_id"
  add_index "calendar_events", ["user_id"], name: "index_calendar_events_on_user_id"

  create_table "carepro_relationships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "patient_id"
  end

  add_index "carepro_relationships", ["patient_id"], name: "index_carepro_relationships_on_patient_id"
  add_index "carepro_relationships", ["user_id"], name: "index_carepro_relationships_on_user_id"

  create_table "family_relationships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "patient_id"
  end

  add_index "family_relationships", ["patient_id"], name: "index_family_relationships_on_patient_id"
  add_index "family_relationships", ["user_id"], name: "index_family_relationships_on_user_id"

  create_table "illnesses", force: :cascade do |t|
    t.string "name"
  end

  create_table "patient_illnesses", force: :cascade do |t|
    t.integer "illness_id"
    t.integer "patient_id"
  end

  add_index "patient_illnesses", ["illness_id"], name: "index_patient_illnesses_on_illness_id"
  add_index "patient_illnesses", ["patient_id"], name: "index_patient_illnesses_on_patient_id"

  create_table "patients", force: :cascade do |t|
    t.string  "name"
    t.text    "image"
    t.string  "phone_no"
    t.text    "address"
    t.string  "email"
    t.text    "about"
    t.string  "gender"
    t.string  "password_digest"
    t.integer "age"
    t.integer "created_by_user_id"
  end

  add_index "patients", ["created_by_user_id"], name: "index_patients_on_created_by_user_id"

  create_table "ratings", force: :cascade do |t|
    t.string  "user_id"
    t.integer "rating"
  end

  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string  "name"
    t.text    "image"
    t.string  "phone_no"
    t.text    "address"
    t.string  "email"
    t.text    "specialty"
    t.string  "role"
    t.integer "hourlyrate"
    t.string  "gender"
    t.boolean "iscarepro",       default: false
    t.string  "password_digest"
    t.text    "about"
  end

end
