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

ActiveRecord::Schema.define(version: 20141004115735) do

  create_table "ballers", force: true do |t|
    t.string "name", limit: 200
    t.string "team", limit: 200
  end

  create_table "database_list", force: true do |t|
    t.string "state",      limit: 100
    t.string "area_type",  limit: 100
    t.string "state_abb",  limit: 100
    t.string "state_full", limit: 100
    t.string "dbname",     limit: 100
    t.string "link",       limit: 10000
    t.string "comment",    limit: 1000
  end

  add_index "database_list", ["comment"], name: "comment", using: :btree
  add_index "database_list", ["link"], name: "link", length: {"link"=>1000}, using: :btree
  add_index "database_list", ["state", "dbname"], name: "idx", unique: true, using: :btree
  add_index "database_list", ["state"], name: "state", using: :btree
  add_index "database_list", ["state_abb"], name: "state_abb", using: :btree

  create_table "runtime", force: true do |t|
    t.string  "state",       limit: 100
    t.string  "runtime",     limit: 100
    t.string  "pagecount",   limit: 100
    t.string  "insertcount", limit: 100
    t.integer "rundate",                 null: false
    t.string  "date",        limit: 100
    t.date    "dateformal",              null: false
  end

  add_index "runtime", ["date"], name: "date_idx", using: :btree
  add_index "runtime", ["dateformal"], name: "dateformal", using: :btree
  add_index "runtime", ["rundate", "state"], name: "rundate", using: :btree
  add_index "runtime", ["state", "rundate", "dateformal"], name: "all_idx", using: :btree
  add_index "runtime", ["state"], name: "state_idx", using: :btree

  create_table "tweets", force: true do |t|
    t.string  "status",    limit: 200
    t.string  "baller",    limit: 200
    t.integer "baller_id"
  end

end
