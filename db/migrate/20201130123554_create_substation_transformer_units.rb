class CreateSubstationTransformerUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :substation_transformer_units do |t|
      t.string :cod_id
      t.text :descr
      t.string :barr_1
      t.string :barr_2
      t.string :barr_3
      t.string :sub
      t.decimal :pot_nom
      t.st_point :geometry, srid: 4674

      t.column  :created_at , :timestamp, :null => true
      t.column  :updated_at , :timestamp, :null => true
    end

    add_index :substation_transformer_units, :cod_id,   unique: true
    add_index :substation_transformer_units, :geometry, using:  :gist
  end
end
