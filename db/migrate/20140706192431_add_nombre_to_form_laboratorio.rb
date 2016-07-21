class AddNombreToFormLaboratorio < ActiveRecord::Migration
  def change
    add_column :form_laboratorios, :nombre, :string
  end
end
