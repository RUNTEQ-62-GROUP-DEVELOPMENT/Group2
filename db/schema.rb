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

ActiveRecord::Schema[7.0].define(version: 2025_01_19_063035) do
  create_table "books", charset: "utf8mb4", force: :cascade do |t|
    t.string "title", null: false
    t.string "author", null: false
    t.integer "pages", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "goals", charset: "utf8mb4", force: :cascade do |t|
    t.date "start_date", null: false
    t.date "target_date", null: false
    t.integer "pages_per_day", null: false
    t.integer "reading_pages", null: false
    t.integer "status", null: false
    t.bigint "user_id", null: false
    t.bigint "book_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_goals_on_book_id"
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "books", "users"
  add_foreign_key "goals", "books"
  add_foreign_key "goals", "users"
end
