class CreateBuses < ActiveRecord::Migration[5.2]
  def change
    create_table :buses do |t|
      t.string :cod_id
      t.text :descr
      t.string :sub
      t.string :ten_nom

      t.column  :created_at, :timestamp, null: true
      t.column  :updated_at, :timestamp, null: true
    end

    add_index :buses, :cod_id,	unique:	true
  end
end
