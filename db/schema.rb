# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160201231005) do

  create_table "games", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "date"
    t.integer  "home_points"
    t.integer  "visiting_points"
    t.string   "time_of_game"
    t.integer  "home_teamID"
    t.integer  "visit_teamID"
    t.integer  "nba_id"
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.integer  "fg_percent"
    t.integer  "fg3_percent"
    t.integer  "ft_percent"
    t.integer  "reb"
    t.integer  "assist"
    t.integer  "tov"
    t.integer  "stl"
    t.integer  "blk"
    t.integer  "pts"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "teams", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
    t.string   "conference"
    t.integer  "rank"
    t.integer  "wins"
    t.integer  "losses"
    t.integer  "pts_per_game"
    t.integer  "reb_per_game"
    t.integer  "asst_per_game"
    t.integer  "nba_id"
    t.string   "city"
  end

end
