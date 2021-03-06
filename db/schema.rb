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

ActiveRecord::Schema.define(version: 2019_02_18_082211) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "courses", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_courses_on_name", unique: true
  end

  create_table "event_rounds", force: :cascade do |t|
    t.bigint "series_event_id", null: false
    t.bigint "course_id"
    t.integer "round_num", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_event_rounds_on_course_id"
    t.index ["series_event_id", "round_num"], name: "index_event_rounds_on_series_event_id_and_round_num", unique: true
    t.index ["series_event_id"], name: "index_event_rounds_on_series_event_id"
  end

  create_table "holes", force: :cascade do |t|
    t.integer "position", null: false
    t.string "label"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_holes_on_course_id"
    t.index ["position", "course_id"], name: "index_holes_on_position_and_course_id", unique: true
  end

  create_table "league_series", force: :cascade do |t|
    t.string "title"
    t.date "date_start"
    t.date "date_end"
    t.bigint "league_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_league_series_on_league_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "timezone", default: "America/Los Angeles"
  end

  create_table "pins", force: :cascade do |t|
    t.string "label", null: false
    t.integer "distance_value"
    t.string "distance_unit"
    t.integer "par"
    t.bigint "hole_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hole_id"], name: "index_pins_on_hole_id"
    t.index ["label", "hole_id"], name: "index_pins_on_label_and_hole_id", unique: true
  end

  create_table "player_events", force: :cascade do |t|
    t.bigint "series_event_id"
    t.bigint "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_player_events_on_player_id"
    t.index ["series_event_id", "player_id"], name: "index_player_events_on_series_event_id_and_player_id", unique: true
    t.index ["series_event_id"], name: "index_player_events_on_series_event_id"
  end

  create_table "player_rounds", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.bigint "event_round_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_round_id"], name: "index_player_rounds_on_event_round_id"
    t.index ["player_id"], name: "index_player_rounds_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.bigint "league_id"
    t.string "pin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "player_name"
    t.integer "player_number"
    t.index ["league_id", "player_number"], name: "index_players_on_league_id_and_player_number", unique: true
    t.index ["league_id"], name: "index_players_on_league_id"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "round_card_scores", force: :cascade do |t|
    t.bigint "round_card_id"
    t.bigint "round_player_id"
    t.bigint "hole_id"
    t.jsonb "hole_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hole_id"], name: "index_round_card_scores_on_hole_id"
    t.index ["round_card_id", "round_player_id", "hole_id"], name: "round_card_player_hole_index", unique: true
    t.index ["round_card_id"], name: "index_round_card_scores_on_round_card_id"
    t.index ["round_player_id"], name: "index_round_card_scores_on_round_player_id"
  end

  create_table "round_cards", force: :cascade do |t|
    t.bigint "event_round_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_round_id"], name: "index_round_cards_on_event_round_id"
  end

  create_table "round_players", force: :cascade do |t|
    t.bigint "event_round_id"
    t.bigint "player_id"
    t.bigint "round_card_id"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_round_id", "player_id"], name: "index_round_players_on_event_round_id_and_player_id", unique: true
    t.index ["event_round_id"], name: "index_round_players_on_event_round_id"
    t.index ["player_id"], name: "index_round_players_on_player_id"
    t.index ["round_card_id"], name: "index_round_players_on_round_card_id"
  end

  create_table "series_events", force: :cascade do |t|
    t.bigint "league_series_id"
    t.string "title"
    t.datetime "event_start_time"
    t.datetime "event_end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_series_id", "title"], name: "index_series_events_on_league_series_id_and_title", unique: true
    t.index ["league_series_id"], name: "index_series_events_on_league_series_id"
  end

  create_table "series_players", force: :cascade do |t|
    t.bigint "league_series_id"
    t.bigint "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_series_id", "player_id"], name: "index_series_players_on_league_series_id_and_player_id", unique: true
    t.index ["league_series_id"], name: "index_series_players_on_league_series_id"
    t.index ["player_id"], name: "index_series_players_on_player_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "event_rounds", "courses"
  add_foreign_key "event_rounds", "series_events"
  add_foreign_key "holes", "courses"
  add_foreign_key "player_events", "players"
  add_foreign_key "player_events", "series_events"
  add_foreign_key "player_rounds", "event_rounds"
  add_foreign_key "player_rounds", "players"
  add_foreign_key "players", "leagues"
  add_foreign_key "players", "users"
  add_foreign_key "round_card_scores", "holes"
  add_foreign_key "round_card_scores", "round_cards"
  add_foreign_key "round_card_scores", "round_players"
  add_foreign_key "round_cards", "event_rounds"
  add_foreign_key "round_players", "event_rounds"
  add_foreign_key "round_players", "players"
  add_foreign_key "round_players", "round_cards"
  add_foreign_key "series_events", "league_series"
  add_foreign_key "series_players", "league_series"
  add_foreign_key "series_players", "players"
end
