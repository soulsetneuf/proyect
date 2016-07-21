class CreateFormLiquidos < ActiveRecord::Migration
  def change
    create_table :form_liquidos do |t|
      t.references :paciente, index: true
      t.references :hospital, index: true
      t.string :servicio
      t.string :medico_solicitante
      t.string :diag_clinico
      t.string :datos_impot
      t.string :fun
      t.string :fup
      t.string :hormonoterapia
      t.string :radioterapia
      t.text :conclusion
      t.string :dr
      t.string :citologo

      t.timestamps
    end
  end
end
