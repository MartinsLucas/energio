class CreateLowVoltageConsumptionUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :low_voltage_consumption_units do |t|
      t.text :descr
      t.string :pn_con
      t.string :ctmt
      t.string :uni_tr_s
      t.string :sub
      t.string :conj
      t.string :mun
      t.string :brr
      t.string :cep
      t.string :cnae
      t.string :tip_cc
      t.string :fas_con
      t.string :gru_ten
      t.string :ten_forn
      t.string :gru_tar
      t.string :dat_con
      t.decimal :car_inst
      t.decimal :liv
      t.decimal :dic
      t.decimal :fic
      t.string :are_loc
      t.multi_line_string :geometry, srid: 4674

      t.column  :created_at, :timestamp, null: true
      t.column  :updated_at, :timestamp, null: true
    end

    add_index :low_voltage_consumption_units, :geometry, using:  :gist
  end
end
