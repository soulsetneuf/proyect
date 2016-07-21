class AddTipoToPacientes < ActiveRecord::Migration
  def change
    add_column :pacientes, :tipo, :string
  end
end
