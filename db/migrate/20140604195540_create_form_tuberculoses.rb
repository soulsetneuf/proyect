class CreateFormTuberculoses < ActiveRecord::Migration
  def change
    create_table :form_tuberculoses do |t|
      t.references :paciente, index: true
      t.references :hospital, index: true

      t.timestamps
    end
  end
end
