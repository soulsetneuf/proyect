class AddEdadMenarquiaToFormCancerUterino < ActiveRecord::Migration
  def change
    add_column :form_cancer_uterinos, :edad_menarquia, :string
  end
end
