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

ActiveRecord::Schema[7.1].define(version: 2024_04_23_175949) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "emails", force: :cascade do |t|
    t.string "str_value", null: false
    t.boolean "active", default: false
    t.boolean "archived", default: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "family_member_id"
    t.index ["active"], name: "index_emails_on_active"
    t.index ["archived"], name: "index_emails_on_archived"
    t.index ["family_member_id"], name: "index_emails_on_family_member_id"
    t.index ["str_value"], name: "index_emails_on_str_value"
    t.index ["user_id"], name: "index_emails_on_user_id"
  end

  create_table "family_members", force: :cascade do |t|
    t.string "surname", null: false
    t.string "othername"
    t.string "firstname", null: false
    t.string "nationality"
    t.string "recidence_address"
    t.string "reference", null: false
    t.integer "occupation_id"
    t.integer "phone_id"
    t.integer "email_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "archived", default: false
    t.index ["archived"], name: "index_family_members_on_archived"
    t.index ["email_id"], name: "index_family_members_on_email_id"
    t.index ["firstname"], name: "index_family_members_on_firstname"
    t.index ["occupation_id"], name: "index_family_members_on_occupation_id"
    t.index ["othername"], name: "index_family_members_on_othername"
    t.index ["phone_id"], name: "index_family_members_on_phone_id"
    t.index ["reference"], name: "index_family_members_on_reference"
    t.index ["surname"], name: "index_family_members_on_surname"
  end

  create_table "levels", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_levels_on_name", unique: true
  end

  create_table "occupations", force: :cascade do |t|
    t.boolean "archived", default: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["archived"], name: "index_occupations_on_archived"
    t.index ["name"], name: "index_occupations_on_name"
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

  create_table "relation_types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_relation_types_on_name", unique: true
  end

  create_table "student_family_members", force: :cascade do |t|
    t.integer "student_id"
    t.integer "family_member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "relation_type_id"
    t.index ["family_member_id"], name: "index_student_family_members_on_family_member_id"
    t.index ["relation_type_id"], name: "index_student_family_members_on_relation_type_id"
    t.index ["student_id"], name: "index_student_family_members_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "surname", null: false
    t.string "othername"
    t.string "firstname", null: false
    t.string "profile_picture"
    t.date "dob", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "level_id"
    t.integer "enrollment_status", default: 0
    t.integer "status", default: 0
    t.boolean "archived", default: false
    t.index ["archived"], name: "index_students_on_archived"
    t.index ["enrollment_status"], name: "index_students_on_enrollment_status"
    t.index ["firstname"], name: "index_students_on_firstname"
    t.index ["level_id"], name: "index_students_on_level_id"
    t.index ["othername"], name: "index_students_on_othername"
    t.index ["status"], name: "index_students_on_status"
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
    t.integer "family_member_id"
    t.index ["active"], name: "index_telephones_on_active"
    t.index ["archived"], name: "index_telephones_on_archived"
    t.index ["family_member_id"], name: "index_telephones_on_family_member_id"
    t.index ["parent_id"], name: "index_telephones_on_parent_id"
    t.index ["str_value"], name: "index_telephones_on_str_value"
    t.index ["user_id"], name: "index_telephones_on_user_id"
  end

  create_table "user_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "user_type_id", null: false
    t.boolean "archived", default: false
    t.string "password_digest"
    t.string "firstname"
    t.string "username"
    t.string "lastname"
    t.string "othername"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: false
    t.string "token_id"
    t.index ["active"], name: "index_users_on_active"
    t.index ["archived"], name: "index_users_on_archived"
    t.index ["token_id"], name: "index_users_on_token_id"
    t.index ["user_type_id"], name: "index_users_on_user_type_id"
  end

end
