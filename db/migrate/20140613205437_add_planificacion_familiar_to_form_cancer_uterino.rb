class AddPlanificacionFamiliarToFormCancerUterino < ActiveRecord::Migration
  def change
    add_column :form_cancer_uterinos, :planificacion_familiar, :string
  end
end
