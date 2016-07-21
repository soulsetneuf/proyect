class CreateBaciloscopiaForms < ActiveRecord::Migration
  def change
    create_table :baciloscopia_forms do |t|
      t.references :paciente, index: true
      t.references :hospital, index: true
      t.date :fecha
      t.string :tipo_muestra
      t.string :razon_solicitud
      t.string :l_j
      t.string :s_t
      t.date :periodo

      t.timestamps
    end
  end
end
