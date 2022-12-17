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

ActiveRecord::Schema[7.0].define(version: 2022_12_17_150024) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "children", force: :cascade do |t|
    t.bigint "parent_id"
    t.integer "status"
    t.string "full_address"
    t.string "full_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "teacher_id"
    t.string "qr_code"
    t.date "birthday"
    t.bigint "trip_id"
    t.index ["parent_id"], name: "index_children_on_parent_id"
    t.index ["teacher_id"], name: "index_children_on_teacher_id"
    t.index ["trip_id"], name: "index_children_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "pick_up_time"
    t.datetime "drop_off_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "role_type"
    t.string "full_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "children", "trips"
  add_foreign_key "children", "users", column: "parent_id"
  add_foreign_key "children", "users", column: "teacher_id"
  add_foreign_key "trips", "users"
end
