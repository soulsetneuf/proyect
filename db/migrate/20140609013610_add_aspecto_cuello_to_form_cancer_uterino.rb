class AddAspectoCuelloToFormCancerUterino < ActiveRecord::Migration
  def change
    add_column :form_cancer_uterinos, :aspecto_cuello, :string
  end
end
