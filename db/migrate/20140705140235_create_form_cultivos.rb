class CreateFormCultivos < ActiveRecord::Migration
  def change
    create_table :form_cultivos do |t|
      t.references :paciente, index: true
      t.references :hospital, index: true
      t.date :fecha
      t.string :tipo_muestra
      t.string :medico
      t.date :periodo
      t.text :observaciones

      t.timestamps
    end
  end
end
