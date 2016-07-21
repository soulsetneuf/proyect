class RemoveAspectoCuelloFromCancerUterino < ActiveRecord::Migration
  def change
    remove_column :form_cancer_uterinos, :aspecto_cuello, :string
  end
end
