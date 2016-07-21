class RemoveNroFromFormCancerUterinos < ActiveRecord::Migration
  def change
    remove_column :form_cancer_uterinos, :nro, :integer
  end
end
