class CreateSectors < ActiveRecord::Migration
  def change
    create_table :sectors do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
