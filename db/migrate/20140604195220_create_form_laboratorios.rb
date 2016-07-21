class CreateFormLaboratorios < ActiveRecord::Migration
  def change
    create_table :form_laboratorios do |t|
      t.references :paciente, index: true
      t.references :usuario, index: true
      t.references :hospital, index: true
      t.datetime :fecha_toma_muestra
      t.datetime :fecha_entrega

      t.timestamps
    end
  end
end
