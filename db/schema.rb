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

ActiveRecord::Schema.define(version: 2019_02_01_082535) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_admin_comments', force: :cascade do |t|
    t.string 'namespace'
    t.text 'body'
    t.string 'resource_type'
    t.bigint 'resource_id'
    t.string 'author_type'
    t.bigint 'author_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['author_type', 'author_id'], name: 'index_active_admin_comments_on_author_type_and_author_id'
    t.index ['namespace'], name: 'index_active_admin_comments_on_namespace'
    t.index ['resource_type', 'resource_id'], name: 'index_active_admin_comments_on_resource_type_and_resource_id'
  end

  create_table 'admin_users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_admin_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_admin_users_on_reset_password_token', unique: true
  end

  create_table 'league_series', force: :cascade do |t|
    t.string 'title'
    t.date 'date_start'
    t.date 'date_end'
    t.bigint 'league_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['league_id'], name: 'index_league_series_on_league_id'
  end

  create_table 'leagues', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'player_events', force: :cascade do |t|
    t.bigint 'series_event_id'
    t.bigint 'player_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['player_id'], name: 'index_player_events_on_player_id'
    t.index ['series_event_id', 'player_id'], name: 'index_player_events_on_series_event_id_and_player_id', unique: true
    t.index ['series_event_id'], name: 'index_player_events_on_series_event_id'
  end

  create_table 'players', force: :cascade do |t|
    t.bigint 'league_id'
    t.integer 'player_number'
    t.string 'display_name'
    t.string 'pin'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['league_id', 'player_number'], name: 'index_players_on_league_id_and_player_number', unique: true
    t.index ['league_id'], name: 'index_players_on_league_id'
  end

  create_table 'series_events', force: :cascade do |t|
    t.bigint 'league_series_id'
    t.string 'title'
    t.datetime 'event_start_time'
    t.datetime 'event_end_time'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['league_series_id', 'title'], name: 'index_series_events_on_league_series_id_and_title', unique: true
    t.index ['league_series_id'], name: 'index_series_events_on_league_series_id'
  end

  create_table 'series_players', force: :cascade do |t|
    t.bigint 'league_series_id'
    t.bigint 'player_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['league_series_id', 'player_id'], name: 'index_series_players_on_league_series_id_and_player_id', unique: true
    t.index ['league_series_id'], name: 'index_series_players_on_league_series_id'
    t.index ['player_id'], name: 'index_series_players_on_player_id'
  end

  add_foreign_key 'player_events', 'players'
  add_foreign_key 'player_events', 'series_events'
  add_foreign_key 'players', 'leagues'
  add_foreign_key 'series_events', 'league_series'
  add_foreign_key 'series_players', 'league_series'
  add_foreign_key 'series_players', 'players'
end
