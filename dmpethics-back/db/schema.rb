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

ActiveRecord::Schema.define(version: 2019_05_12_175952) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "study"
    t.json "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_id"
    t.string "topics"
    t.string "pid"
    t.string "country"
    t.string "institutions"
    t.string "title"
    t.string "authors"
    t.string "ethics"
    t.string "description"
    t.string "status"
  end

  create_table "checklists", force: :cascade do |t|
    t.string "study_id"
    t.json "list"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "study_details", force: :cascade do |t|
    t.string "institution"
    t.string "user_id"
    t.string "researchgroup_id"
    t.string "study_description"
    t.string "study_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_firstname"
    t.string "user_surname"
    t.string "user_email"
    t.string "user_password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
