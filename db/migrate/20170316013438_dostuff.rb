class Dostuff < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :users
    add_column :users, :photo, :string
  end
end
