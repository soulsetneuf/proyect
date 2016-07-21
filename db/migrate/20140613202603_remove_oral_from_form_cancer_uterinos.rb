class RemoveOralFromFormCancerUterinos < ActiveRecord::Migration
  def change
    remove_column :form_cancer_uterinos, :oral, :boolean
  end
end
