class CreateSubstations < ActiveRecord::Migration[5.2]
  def change
    create_table :substations do |t|
      t.string :cod_id
      t.text :descr
      t.string :nom
      t.multi_polygon :geometry, srid: 4674

      t.column  :created_at , :timestamp, :null => true
      t.column  :updated_at , :timestamp, :null => true
    end

    add_index :substations, :cod_id,		unique:	true
    add_index :substations, :geometry,	using:	:gist
  end
end
