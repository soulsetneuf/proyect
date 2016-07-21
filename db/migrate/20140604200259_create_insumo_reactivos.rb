class CreateInsumoReactivos < ActiveRecord::Migration
  def change
    create_table :insumo_reactivos do |t|
      t.references :form_laboratorio, index: true
      t.string :tipo
      t.string :nombre
      t.string :unidad_medida
      t.float :cantidad
      t.float :costo_unitario
      t.float :costo_total
      t.string :partida
      t.text :descripcion

      t.timestamps
    end
  end
end
