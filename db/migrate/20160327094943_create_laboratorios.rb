class CreateLaboratorios < ActiveRecord::Migration
  def change
    create_table :laboratorios do |t|
      t.references :persona, index: true
      t.string :nombre

      t.timestamps
    end
  end
end
