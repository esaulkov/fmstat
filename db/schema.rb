# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_23_131307) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_buffercache"
  enable_extension "pg_stat_statements"
  enable_extension "plpgsql"
  enable_extension "sslinfo"

  create_table "player_stats", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.string "position"
    t.string "club"
    t.integer "age"
    t.integer "wage"
    t.integer "height"
    t.string "left_foot"
    t.string "right_foot"
    t.jsonb "stat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid"], name: "index_player_stats_on_uid", unique: true
  end

end
