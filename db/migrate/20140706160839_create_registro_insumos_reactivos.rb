class CreateRegistroInsumosReactivos < ActiveRecord::Migration
  def change
    create_table :registro_insumos_reactivos do |t|
      t.string :estado
      t.references :insumo_reactivo, index: true
      t.float :cantidad
      t.string :personal_entregante
      t.string :pesonal_receptor
      t.text :observaciones

      t.timestamps
    end
  end
end
