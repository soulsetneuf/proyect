class RemoveLigaduraTrompasFromFormCancerUterinos < ActiveRecord::Migration
  def change
    remove_column :form_cancer_uterinos, :ligadura_trompas
  end
end
