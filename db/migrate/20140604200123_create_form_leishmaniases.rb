class CreateFormLeishmaniases < ActiveRecord::Migration
  def change
    create_table :form_leishmaniases do |t|
      t.references :paciente, index: true
      t.references :hospital, index: true
      t.string :lug_prob_infeccion
      t.string :tipo_lesion
      t.string :ubicacion_lesion
      t.string :tiempo_evol_lesion
      t.string :n_muestras_tom
      t.string :post_tratam
      t.string :epd
      t.string :idrm
      t.string :cultivo
      t.string :pcr
      t.string :otro
      t.string :medico_solicitante
      t.string :firma

      t.timestamps
    end
  end
end
