class RemoveOtrosFromFormCancerUterinos < ActiveRecord::Migration
  def change
    remove_column :form_cancer_uterinos, :otros, :text
  end
end
