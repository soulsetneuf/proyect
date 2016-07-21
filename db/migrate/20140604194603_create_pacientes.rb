class CreatePacientes < ActiveRecord::Migration
  def change
    create_table :pacientes do |t|
      t.references :form_laboratorio, index: true
      t.string :nombres
      t.string :apellidos
      t.date :fecha_nacimiento
      t.integer :edad
      t.string :sexo
      t.string :direccion
      t.string :ciudad
      t.integer :telefono

      t.timestamps
    end
  end
end
