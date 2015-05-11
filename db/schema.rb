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

ActiveRecord::Schema.define(version: 20150427222600) do

  create_table "labolatories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "subject_teachers", force: :cascade do |t|
    t.integer  "subject_id", limit: 4, null: false
    t.integer  "teacher_id", limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "allow_auditor", limit: 255
    t.string   "code",          limit: 255
    t.string   "condition",     limit: 255
    t.string   "credit",        limit: 255
    t.string   "default_grade", limit: 255
    t.string   "method",        limit: 255
    t.string   "location",      limit: 255
    t.string   "period",        limit: 255
    t.string   "semester",      limit: 255
    t.string   "title",         limit: 255
    t.string   "title_sub",     limit: 255
    t.text     "abstract",      limit: 65535
    t.text     "note",          limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.binary   "face_main",  limit: 65535
    t.binary   "face_sub",   limit: 65535
    t.binary   "voice",      limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

end
