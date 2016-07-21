class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.string :nombre
      t.string :sigla
      t.string :provincia
      t.string :ciudad
      t.string :direccion
      t.string :logo
      t.string :distrito
      t.string :establecimiento
      t.string :centro_salud
      t.string :descripcion

      t.timestamps
    end
  end
end
