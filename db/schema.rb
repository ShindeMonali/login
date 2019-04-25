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

ActiveRecord::Schema.define(version: 2019_04_23_122649) do

  create_table "courses", force: :cascade do |t|
    t.string "mode"
    t.string "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "courses_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "course_id", null: false
    t.index ["course_id", "user_id"], name: "index_courses_users_on_course_id_and_user_id"
    t.index ["user_id", "course_id"], name: "index_courses_users_on_user_id_and_course_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "User_name"
    t.string "Email"
    t.string "Password"
    t.string "Confirm_password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "Mobile_number"
    t.string "Gender"
    t.string "Address"
    t.string "tyype"
    t.string "hobbies"
  end

end
