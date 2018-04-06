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

ActiveRecord::Schema.define(version: 20180405111024) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "descriptives", force: :cascade do |t|
    t.string "term"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "free_tags", force: :cascade do |t|
    t.bigint "record_id"
    t.bigint "descriptive_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["descriptive_id"], name: "index_free_tags_on_descriptive_id"
    t.index ["record_id"], name: "index_free_tags_on_record_id"
    t.index ["user_id"], name: "index_free_tags_on_user_id"
  end

  create_table "records", force: :cascade do |t|
    t.string "title"
    t.string "creator"
    t.string "url"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "scale_tags", force: :cascade do |t|
    t.bigint "record_id"
    t.bigint "scale_id"
    t.bigint "user_id"
    t.float "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_id"], name: "index_scale_tags_on_record_id"
    t.index ["scale_id"], name: "index_scale_tags_on_scale_id"
    t.index ["user_id"], name: "index_scale_tags_on_user_id"
  end

  create_table "scales", force: :cascade do |t|
    t.string "left"
    t.string "right"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
