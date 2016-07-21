class AddFormLaboratorioToRegistroInsumosReactivos < ActiveRecord::Migration
  def change
    add_reference :registro_insumos_reactivos, :form_laboratorio, index: true
  end
end
