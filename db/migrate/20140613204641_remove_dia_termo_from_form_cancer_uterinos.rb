class RemoveDiaTermoFromFormCancerUterinos < ActiveRecord::Migration
  def change
    remove_column :form_cancer_uterinos, :dia_termo, :date
  end
end
