class RemoveRitmoFromFormCancerUterinos < ActiveRecord::Migration
  def change
    remove_column :form_cancer_uterinos, :ritmo, :string
  end
end
