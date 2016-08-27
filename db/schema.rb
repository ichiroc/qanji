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

ActiveRecord::Schema.define(version: 20160812014022) do

  create_table "coordinates", force: :cascade do |t|
    t.float    "x",          null: false
    t.float    "y",          null: false
    t.integer  "word_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["word_id"], name: "index_coordinates_on_word_id"
  end

  create_table "images", force: :cascade do |t|
    t.string   "file_name",    null: false
    t.string   "content_type", null: false
    t.binary   "data",         null: false
    t.string   "job_key"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "job_logs", force: :cascade do |t|
    t.string   "key",        null: false
    t.string   "status",     null: false
    t.datetime "queue_time", null: false
    t.string   "message"
    t.text     "raw_text",   null: false
    t.integer  "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["image_id"], name: "index_job_logs_on_image_id"
  end

  create_table "words", force: :cascade do |t|
    t.string   "text",       null: false
    t.float    "score"
    t.string   "category"
    t.integer  "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["image_id"], name: "index_words_on_image_id"
  end

end
