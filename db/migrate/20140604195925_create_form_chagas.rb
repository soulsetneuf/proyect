class CreateFormChagas < ActiveRecord::Migration
  def change
    create_table :form_chagas do |t|
      t.references :paciente, index: true
      t.references :hospital, index: true
      t.string :cod_form_chagas
      t.string :muestra
      t.string :diag_serologico
      t.string :conclucion_diag
      t.string :diag_confir
      t.string :conclu_pueb_confir
      t.text :observaciones
      t.string :firma

      t.timestamps
    end
  end
end
