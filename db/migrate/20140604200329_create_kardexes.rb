class CreateKardexes < ActiveRecord::Migration
  def change
    create_table :kardexes do |t|
      t.references :insumo_reactivo, index: true
      t.date :fecha
      t.float :reg_entrada
      t.float :reg_salida
      t.float :saldo
      t.string :recibido_entregado
      t.text :observaciones

      t.timestamps
    end
  end
end
