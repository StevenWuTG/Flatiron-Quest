# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_19_170015) do

  create_table "battles", force: :cascade do |t|
    t.string "battle_name"
    t.integer "user_id"
    t.integer "quest_id"
    t.integer "monster_id"
    t.integer "support_id"
  end

  create_table "monsters", force: :cascade do |t|
    t.string "mon_name"
    t.integer "mon_health"
    t.integer "mon_attack"
    t.integer "mon_level"
  end

  create_table "quests", force: :cascade do |t|
    t.string "quest_name"
    t.integer "quest_level"
  end

  create_table "supports", force: :cascade do |t|
    t.string "support_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "user_password"
    t.integer "user_health"
    t.integer "user_attack"
    t.integer "user_level"
  end

end
