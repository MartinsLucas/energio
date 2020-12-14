class CreateNotablePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :notable_points do |t|
      t.string :cod_id
      t.text :descr
      t.string :conj
      t.st_point :geometry, srid: 4674

      t.column  :created_at, :timestamp, null: true
      t.column  :updated_at, :timestamp, null: true
    end

    add_index :notable_points, :cod_id,	unique:	true
    add_index :notable_points, :geometry,	using:	:gist
  end
end
