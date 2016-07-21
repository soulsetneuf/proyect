class CreateFormMalaria < ActiveRecord::Migration
  def change
    create_table :form_malaria do |t|
      t.references :paciente, index: true
      t.references :hospital, index: true
      t.string :tiene_malar_trat_antimalarico
      t.string :diagnostico
      t.string :tratami
      t.string :compl_trat
      t.string :lugar_tratado
      t.string :lug_hace_sema
      t.string :ocupacion
      t.string :tipo_caso
      t.string :inicio_sint
      t.string :tipo
      t.string :prueba
      t.string :resultado
      t.string :densidad_paras
      t.string :peso
      t.string :trat_superv
      t.string :req_trat_mal_grave
      t.string :persis_sintom
      t.date :fecha_control
      t.string :firma

      t.timestamps
    end
  end
end
