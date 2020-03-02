# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_28_144550) do

  create_table "books", force: :cascade do |t|
    t.string "title", null: false
    t.string "author_first", null: false
    t.string "author_last", null: false
    t.string "genre"
    t.string "series"
    t.integer "sort"
    t.boolean "book_owned"
    t.boolean "book_read"
    t.boolean "book_read_date"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer "system_id"
    t.integer "status_id"
    t.string "title", null: false
    t.string "series"
    t.string "sort"
    t.string "service"
    t.boolean "owned"
    t.integer "hr_est"
    t.integer "hr_comp"
    t.date "date_comp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status_id"], name: "index_games_on_status_id"
    t.index ["system_id"], name: "index_games_on_system_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "key"
    t.string "name"
  end

  create_table "systems", force: :cascade do |t|
    t.string "system", null: false
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "games", "statuses"
  add_foreign_key "games", "systems"
end
