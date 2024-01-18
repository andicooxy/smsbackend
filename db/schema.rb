# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_01_17_180401) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "emails", force: :cascade do |t|
    t.string "str_value", null: false
    t.integer "parent_id"
    t.boolean "active", default: false
    t.boolean "archived", default: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_emails_on_active"
    t.index ["archived"], name: "index_emails_on_archived"
    t.index ["parent_id"], name: "index_emails_on_parent_id"
    t.index ["str_value"], name: "index_emails_on_str_value"
    t.index ["user_id"], name: "index_emails_on_user_id"
  end

  create_table "parents", force: :cascade do |t|
    t.string "firstname", null: false
    t.string "surname", null: false
    t.string "othername"
    t.string "occupation", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["firstname"], name: "index_parents_on_firstname"
    t.index ["occupation"], name: "index_parents_on_occupation"
    t.index ["othername"], name: "index_parents_on_othername"
    t.index ["surname"], name: "index_parents_on_surname"
  end

  create_table "registers", force: :cascade do |t|
    t.integer "student_id"
    t.integer "parent_id"
    t.integer "approved_user_id"
    t.integer "activity", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["approved_user_id"], name: "index_registers_on_approved_user_id"
    t.index ["parent_id"], name: "index_registers_on_parent_id"
    t.index ["student_id"], name: "index_registers_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "surname", null: false
    t.string "othername"
    t.string "firstname", null: false
    t.string "profile_picture"
    t.date "dob", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["firstname"], name: "index_students_on_firstname"
    t.index ["othername"], name: "index_students_on_othername"
    t.index ["surname"], name: "index_students_on_surname"
  end

  create_table "telephones", force: :cascade do |t|
    t.string "str_value", null: false
    t.integer "parent_id"
    t.boolean "active", default: false
    t.integer "user_id"
    t.boolean "archived", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_telephones_on_active"
    t.index ["archived"], name: "index_telephones_on_archived"
    t.index ["parent_id"], name: "index_telephones_on_parent_id"
    t.index ["str_value"], name: "index_telephones_on_str_value"
    t.index ["user_id"], name: "index_telephones_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "password_digest"
    t.integer "user_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_type_id"], name: "index_users_on_user_type_id"
  end

end
