class RenameUserIdColumnToFavorites < ActiveRecord::Migration[5.2]
  def change
  	rename_column :favorites, :User_id, :user_id
  end
end
