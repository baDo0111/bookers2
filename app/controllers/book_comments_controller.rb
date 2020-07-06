class BookCommentsController < ApplicationController
  before_action :authenticate_user!
  #before_action :correct_user, only: [:edit, :update, :destroy]

  def create
 	  @book = Book.find(params[:book_id])
    @book_comment = @book.book_comments.new(book_comment_params)
    @book_comment.user_id = current_user.id
  	@book_comment.save
  	redirect_to book_path(@book)
  end

  def update
  end

  def destroy
    book_comment = BookComment.find_by(params[:id])
    book = book_comment.book
    book_comment.destroy
    redirect_to book_path(book)
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

  def correct_user
    book_comment = BookComment.find(params[:id])
    redirect_to book_path unless current_user?(@book_comment_user)
  end
end
