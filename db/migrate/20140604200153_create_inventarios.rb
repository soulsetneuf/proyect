class CreateInventarios < ActiveRecord::Migration
  def change
    create_table :inventarios do |t|
      t.references :insumo_reactivo, index: true
      t.references :form_laboratorio, index: true
      t.references :hospital, index: true
      t.string :nombre
      t.float :stock
      t.text :detalle
      t.string :tipo

      t.timestamps
    end
  end
end
