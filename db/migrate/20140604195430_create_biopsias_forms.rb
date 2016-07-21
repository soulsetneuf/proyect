class CreateBiopsiasForms < ActiveRecord::Migration
  def change
    create_table :biopsias_forms do |t|
      t.references :paciente, index: true
      t.references :hospital, index: true
      t.string :servicio
      t.string :medico_solicitante
      t.string :diag_clinico
      t.string :datos_anatom
      t.string :datos_import
      t.text :macroscopico
      t.text :microscopico
      t.text :diagnostico
      t.string :dr
      t.string :patologo

      t.timestamps
    end
  end
end
