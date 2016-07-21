class CreateDiagnosticos < ActiveRecord::Migration
  def change
    create_table :diagnosticos do |t|
      t.references :paciente, index: true
      t.integer :n_diagnostico
      t.string :despcripcion
      t.string :tipo_diagnostico

      t.timestamps
    end
  end
end
