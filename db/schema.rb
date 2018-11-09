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

ActiveRecord::Schema.define(version: 2018_11_09_185050) do

  create_table "alerts", force: :cascade do |t|
    t.integer "ffni_id"
    t.string "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ffni_id"], name: "index_alerts_on_ffni_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "text"
    t.string "approvals"
    t.string "disapprovals"
    t.integer "user_id"
    t.integer "ffni_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ffni_id"], name: "index_comments_on_ffni_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "ffnis", force: :cascade do |t|
    t.string "topic"
    t.string "media"
    t.string "content"
    t.string "badge"
    t.string "upvotes"
    t.string "downvotes"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_ffnis_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end