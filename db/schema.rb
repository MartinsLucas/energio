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

ActiveRecord::Schema.define(version: 2020_11_27_115757) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "notable_points", force: :cascade do |t|
    t.text "descr"
    t.string "conj"
    t.string "cod_id"
    t.geometry "geometry", limit: {:srid=>4674, :type=>"st_point"}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["cod_id"], name: "index_notable_points_on_cod_id", unique: true
    t.index ["geometry"], name: "index_notable_points_on_geometry", using: :gist
  end

end
