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

ActiveRecord::Schema.define(version: 2020_11_30_124210) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "buses", force: :cascade do |t|
    t.string "cod_id"
    t.text "descr"
    t.string "sub"
    t.string "ten_nom"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["cod_id"], name: "index_buses_on_cod_id", unique: true
  end

  create_table "groups", force: :cascade do |t|
    t.string "cod_id"
    t.text "descr"
    t.string "nom"
    t.geometry "geometry", limit: {:srid=>4674, :type=>"multi_polygon"}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["cod_id"], name: "index_groups_on_cod_id", unique: true
    t.index ["geometry"], name: "index_groups_on_geometry", using: :gist
  end

  create_table "low_voltage_consumption_units", force: :cascade do |t|
    t.text "descr"
    t.string "pn_con"
    t.string "ctmt"
    t.string "uni_tr_s"
    t.string "sub"
    t.string "conj"
    t.string "mun"
    t.string "brr"
    t.string "cep"
    t.string "cnae"
    t.string "tip_cc"
    t.string "fas_con"
    t.string "gru_ten"
    t.string "ten_forn"
    t.string "gru_tar"
    t.string "dat_con"
    t.decimal "car_inst"
    t.decimal "liv"
    t.decimal "dic"
    t.decimal "fic"
    t.string "are_loc"
    t.geometry "geometry", limit: {:srid=>4674, :type=>"multi_line_string"}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["geometry"], name: "index_low_voltage_consumption_units_on_geometry", using: :gist
  end

  create_table "low_voltage_segments", force: :cascade do |t|
    t.string "cod_id"
    t.text "descr"
    t.string "pn_con_1"
    t.string "pn_con_2"
    t.string "ctmt"
    t.string "uni_tr_s"
    t.string "sub"
    t.string "conj"
    t.decimal "comp"
    t.geometry "geometry", limit: {:srid=>4674, :type=>"multi_line_string"}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["cod_id"], name: "index_low_voltage_segments_on_cod_id", unique: true
    t.index ["geometry"], name: "index_low_voltage_segments_on_geometry", using: :gist
  end

  create_table "medium_voltage_circuits", force: :cascade do |t|
    t.string "cod_id"
    t.text "descr"
    t.string "nom"
    t.string "barr"
    t.string "sub"
    t.string "ten_nom"
    t.decimal "ten_ope"
    t.string "uni_tr_s"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["cod_id"], name: "index_medium_voltage_circuits_on_cod_id", unique: true
  end

  create_table "medium_voltage_segments", force: :cascade do |t|
    t.string "cod_id"
    t.text "descr"
    t.string "pn_con_1"
    t.string "pn_con_2"
    t.string "ctmt"
    t.string "uni_tr_s"
    t.string "sub"
    t.string "conj"
    t.decimal "comp"
    t.geometry "geometry", limit: {:srid=>4674, :type=>"multi_line_string"}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["cod_id"], name: "index_medium_voltage_segments_on_cod_id", unique: true
    t.index ["geometry"], name: "index_medium_voltage_segments_on_geometry", using: :gist
  end

  create_table "notable_points", force: :cascade do |t|
    t.string "cod_id"
    t.text "descr"
    t.string "conj"
    t.geometry "geometry", limit: {:srid=>4674, :type=>"st_point"}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["cod_id"], name: "index_notable_points_on_cod_id", unique: true
    t.index ["geometry"], name: "index_notable_points_on_geometry", using: :gist
  end

  create_table "substation_transformer_units", force: :cascade do |t|
    t.string "cod_id"
    t.text "descr"
    t.string "barr_1"
    t.string "barr_2"
    t.string "barr_3"
    t.string "sub"
    t.decimal "pot_nom"
    t.geometry "geometry", limit: {:srid=>4674, :type=>"st_point"}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["cod_id"], name: "index_substation_transformer_units_on_cod_id", unique: true
    t.index ["geometry"], name: "index_substation_transformer_units_on_geometry", using: :gist
  end

  create_table "substations", force: :cascade do |t|
    t.string "cod_id"
    t.text "descr"
    t.string "nom"
    t.geometry "geometry", limit: {:srid=>4674, :type=>"multi_polygon"}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["cod_id"], name: "index_substations_on_cod_id", unique: true
    t.index ["geometry"], name: "index_substations_on_geometry", using: :gist
  end

end
