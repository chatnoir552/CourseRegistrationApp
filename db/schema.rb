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

ActiveRecord::Schema[7.0].define(version: 2023_12_24_160109) do
  create_table "bookmarks", charset: "utf8mb4", force: :cascade do |t|
    t.string "day_of_week", null: false
    t.integer "period", null: false
    t.integer "credit", null: false
    t.string "name", null: false
    t.integer "school_year"
    t.bigint "user_id", null: false
    t.bigint "maincredit_id"
    t.bigint "subcredit_id"
    t.boolean "necessary", null: false
    t.boolean "take"
    t.integer "exam_per"
    t.integer "report_per"
    t.integer "minitest_per"
    t.integer "normal_per"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["maincredit_id"], name: "index_bookmarks_on_maincredit_id"
    t.index ["subcredit_id"], name: "index_bookmarks_on_subcredit_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "follows", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "follow_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "adjust", default: false, null: false
    t.index ["user_id"], name: "index_follows_on_user_id"
  end

  create_table "getcredits", charset: "utf8mb4", force: :cascade do |t|
    t.integer "credit", null: false
    t.bigint "user_id", null: false
    t.bigint "maincredit_id", null: false
    t.bigint "subcredit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["maincredit_id"], name: "index_getcredits_on_maincredit_id"
    t.index ["subcredit_id"], name: "index_getcredits_on_subcredit_id"
    t.index ["user_id"], name: "index_getcredits_on_user_id"
  end

  create_table "maincredits", charset: "utf8mb4", force: :cascade do |t|
    t.string "subject", null: false
    t.integer "credit", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "getcredit"
    t.integer "addcredit", default: 0
    t.index ["user_id"], name: "index_maincredits_on_user_id"
  end

  create_table "subcredits", charset: "utf8mb4", force: :cascade do |t|
    t.string "subject", null: false
    t.string "credit", null: false
    t.bigint "maincredit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "getcredit"
    t.integer "addcredit", default: 0
    t.index ["credit"], name: "index_subcredits_on_credit"
    t.index ["maincredit_id"], name: "index_subcredits_on_maincredit_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest", null: false
    t.boolean "admin", null: false
    t.string "grade", null: false
    t.string "semester", null: false
    t.boolean "private"
  end

  add_foreign_key "bookmarks", "maincredits"
  add_foreign_key "bookmarks", "subcredits"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "follows", "users"
  add_foreign_key "getcredits", "maincredits"
  add_foreign_key "getcredits", "subcredits"
  add_foreign_key "getcredits", "users"
  add_foreign_key "maincredits", "users"
  add_foreign_key "subcredits", "maincredits"
end
