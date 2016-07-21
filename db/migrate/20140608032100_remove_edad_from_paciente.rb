class RemoveEdadFromPaciente < ActiveRecord::Migration
  def change
    remove_column :pacientes, :edad, :integer
  end
end
