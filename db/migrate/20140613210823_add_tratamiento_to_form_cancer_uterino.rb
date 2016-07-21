class AddTratamientoToFormCancerUterino < ActiveRecord::Migration
  def change
    add_column :form_cancer_uterinos, :tratamiento, :string
  end
end
