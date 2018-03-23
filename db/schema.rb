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

ActiveRecord::Schema.define(version: 20180323000336) do

  create_table "color_families", force: :cascade do |t|
    t.string "name"
  end

  create_table "ink_brands", force: :cascade do |t|
    t.string "name"
  end

  create_table "ink_color_families", force: :cascade do |t|
    t.integer "ink_id"
    t.integer "color_family_id"
  end

  create_table "inks", force: :cascade do |t|
    t.integer "ink_brand_id"
    t.string "name"
    t.string "swatch"
    t.text "note"
    t.boolean "favorite"
    t.integer "user_id"
    t.integer "pen_id"
  end

  create_table "pen_brands", force: :cascade do |t|
    t.string "name"
  end

  create_table "pen_types", force: :cascade do |t|
    t.string "name"
  end

  create_table "pens", force: :cascade do |t|
    t.integer "pen_type_id"
    t.integer "pen_brand_id"
    t.string "model"
    t.string "description"
    t.text "note"
    t.boolean "favorite"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "description"
    t.string "avatar_link"
  end

end
