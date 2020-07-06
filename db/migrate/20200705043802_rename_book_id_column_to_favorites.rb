class RenameBookIdColumnToFavorites < ActiveRecord::Migration[5.2]
  def change
  	rename_column :favorites, :Book_id, :book_id
  end
end
