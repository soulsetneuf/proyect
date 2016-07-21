class AddCiToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ci, :int
  end
end
