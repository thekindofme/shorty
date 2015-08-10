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

ActiveRecord::Schema.define(version: 20131107164407) do

  create_table "links", force: true do |t|
    t.string   "url"
    t.string   "shortended_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "links", ["url"], name: "index_links_on_url", unique: true

  create_table "stat_entries", force: true do |t|
    t.integer  "link_id"
    t.string   "query_string"
    t.string   "remote_addr"
    t.string   "remote_host"
    t.string   "request_method"
    t.string   "request_uri"
    t.string   "http_accept"
    t.string   "http_user_agent"
    t.string   "http_accept_encoding"
    t.string   "http_accept_language"
    t.string   "http_cookie"
    t.string   "http_version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
