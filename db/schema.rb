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

ActiveRecord::Schema.define(version: 2021_03_31_195805) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "game_logs", force: :cascade do |t|
    t.bigint "game_id"
    t.date "date"
    t.float "hours"
    t.index ["game_id"], name: "index_game_logs_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.bigint "system_id"
    t.string "title", null: false
    t.string "series"
    t.boolean "owned"
    t.float "hour_estimate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status"
    t.float "order"
    t.index ["system_id"], name: "index_games_on_system_id"
  end

  create_table "systems", force: :cascade do |t|
    t.string "system", null: false
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nickname"
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

  add_foreign_key "game_logs", "games"
  add_foreign_key "games", "systems"
end
