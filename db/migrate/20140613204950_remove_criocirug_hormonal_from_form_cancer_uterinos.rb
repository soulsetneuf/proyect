class RemoveCriocirugHormonalFromFormCancerUterinos < ActiveRecord::Migration
  def change
    remove_column :form_cancer_uterinos, :criocirug_hormonal, :text
  end
end
