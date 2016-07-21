class AddDistritoToFormCancerUterinos < ActiveRecord::Migration
  def change
    add_reference :form_cancer_uterinos, :distrito, index: true
  end
end
