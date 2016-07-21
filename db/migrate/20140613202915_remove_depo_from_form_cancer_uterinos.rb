class RemoveDepoFromFormCancerUterinos < ActiveRecord::Migration
  def change
    remove_column :form_cancer_uterinos, :depo, :boolean
  end
end
