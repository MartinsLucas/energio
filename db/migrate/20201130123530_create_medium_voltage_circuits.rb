class CreateMediumVoltageCircuits < ActiveRecord::Migration[5.2]
  def change
    create_table :medium_voltage_circuits do |t|
      t.string :cod_id
      t.text :descr
      t.string :nom
      t.string :barr
      t.string :sub
      t.string :ten_nom
      t.decimal :ten_ope
      t.string :uni_tr_s

      t.column  :created_at , :timestamp, :null => true
      t.column  :updated_at , :timestamp, :null => true
    end

    add_index :medium_voltage_circuits, :cod_id,   unique: true
  end
end
