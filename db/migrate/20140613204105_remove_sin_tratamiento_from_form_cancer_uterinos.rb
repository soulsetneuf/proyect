class RemoveSinTratamientoFromFormCancerUterinos < ActiveRecord::Migration
  def change
    remove_column :form_cancer_uterinos, :sin_tratamiento, :string
  end
end
