class CreateMediumVoltageSegments < ActiveRecord::Migration[5.2]
  def change
    create_table :medium_voltage_segments do |t|
      t.string :cod_id
      t.text :descr
      t.string :pn_con_1
      t.string :pn_con_2
      t.string :ctmt
      t.string :uni_tr_s
      t.string :sub
      t.string :conj
      t.decimal :comp
      t.multi_line_string :geometry, srid: 4674

      t.column  :created_at, :timestamp, null: true
      t.column  :updated_at, :timestamp, null: true
    end

    add_index :medium_voltage_segments, :cod_id,   unique: true
    add_index :medium_voltage_segments, :geometry, using:  :gist
  end
end
