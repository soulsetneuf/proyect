class CreateComunidads < ActiveRecord::Migration
  def change
    create_table :comunidads do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
