class CreateTuberculosis < ActiveRecord::Migration
  def change
    create_table :tuberculosis do |t|
      t.references :form_laboratorio, index: true
      t.references :paciente, index: true
      t.string :tipo_de_muestra
      t.string :razon
      t.string :medico
      t.string :centro_de_salud
      t.text :observaciones

      t.timestamps
    end
  end
end
