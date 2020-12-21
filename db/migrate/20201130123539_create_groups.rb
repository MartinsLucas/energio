class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :cod_id
      t.text :descr
      t.string :nom
      t.multi_polygon :geometry, srid: 4674

      t.column  :created_at, :timestamp, null: true
      t.column  :updated_at, :timestamp, null: true
    end

    add_index :groups, :cod_id,	unique:	true
    add_index :groups, :geometry,	using:	:gist
  end
end
