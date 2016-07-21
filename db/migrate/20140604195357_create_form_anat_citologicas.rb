class CreateFormAnatCitologicas < ActiveRecord::Migration
  def change
    create_table :form_anat_citologicas do |t|
      t.references :paciente, index: true
      t.references :hospital, index: true
      t.string :servicio
      t.string :cama
      t.text :diagnostico_clinico
      t.text :datos_anatomicos
      t.string :lugar_muestra
      t.text :diagnostico_operatorio
      t.string :pieza_quirurgica
      t.string :biopsia
      t.string :otros
      t.string :conservante
      t.date :fecha_entrega
      t.references :hospital, index: true

      t.timestamps
    end
  end
end
