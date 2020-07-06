class AddUserIdToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :User_id, :integer
  end
end
