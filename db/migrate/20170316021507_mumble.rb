class Mumble < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :photo
    add_column :posts, :photo, :string
  end
end
