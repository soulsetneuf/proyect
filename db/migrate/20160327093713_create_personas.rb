class CreatePersonas < ActiveRecord::Migration
  def change
    create_table :personas do |t|
      t.integer :ci
      t.string :nombre
      t.string :apellido_paterno
      t.string :apellido_materno
      t.string :direccion
      t.string :telefono

      t.timestamps
    end
  end
end
