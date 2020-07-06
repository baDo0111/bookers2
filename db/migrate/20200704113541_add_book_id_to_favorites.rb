class AddBookIdToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :Book_id, :integer
  end
end
