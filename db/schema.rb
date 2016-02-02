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

ActiveRecord::Schema.define(version: 20160202014250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "loans", force: :cascade do |t|
    t.date     "first_payment_date"
    t.integer  "term"
    t.string   "loan_type"
    t.decimal  "loan_amount",        precision: 10, scale: 2
    t.decimal  "second_loan_amount", precision: 10, scale: 2
    t.decimal  "property_value",     precision: 10, scale: 2
    t.integer  "fico1"
    t.integer  "fico2"
    t.boolean  "escrow"
    t.string   "occupancy"
    t.string   "property_type"
    t.string   "deal_type"
    t.integer  "zip_code"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

end
