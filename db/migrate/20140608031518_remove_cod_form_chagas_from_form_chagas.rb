class RemoveCodFormChagasFromFormChagas < ActiveRecord::Migration
  def change
    remove_column :form_chagas, :cod_form_chagas, :string
  end
end
