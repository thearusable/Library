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

ActiveRecord::Schema.define(version: 20150519065838) do

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "image"
    t.text     "description"
    t.integer  "averageRating"
    t.date     "releaseDate"
    t.string   "publishingHouse"
    t.string   "ISBN"
    t.integer  "category_id"
    t.integer  "reservation_id"
  end

  create_table "books_writers", id: false, force: :cascade do |t|
    t.integer "book_id",   null: false
    t.integer "writer_id", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "booksCount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "librarians", force: :cascade do |t|
    t.string   "name"
    t.string   "lastname"
    t.boolean  "admin",                  default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "adress"
    t.string   "phone"
  end

  add_index "librarians", ["email"], name: "index_librarians_on_email", unique: true
  add_index "librarians", ["reset_password_token"], name: "index_librarians_on_reset_password_token", unique: true

  create_table "readers", force: :cascade do |t|
    t.string   "name"
    t.string   "lastname"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "adress"
    t.string   "phone"
  end

  add_index "readers", ["email"], name: "index_readers_on_email", unique: true
  add_index "readers", ["reset_password_token"], name: "index_readers_on_reset_password_token", unique: true

  create_table "reservations", force: :cascade do |t|
    t.boolean  "received"
    t.boolean  "returned"
    t.date     "receivedDate"
    t.date     "returnedDate"
    t.integer  "reader_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "score"
    t.string   "comment"
    t.integer  "book_id"
    t.integer  "reader_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "writers", force: :cascade do |t|
    t.string   "name"
    t.string   "lastname"
    t.text     "biography"
    t.string   "nationality"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
