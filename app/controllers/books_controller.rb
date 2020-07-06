class BooksController < ApplicationController
 before_action :authenticate_user!

	def index
		@books = Book.all
		@book = Book.new
	end

	def show
		@book = Book.find(params[:id])
		@user = @book.user
		@post = Book.new
		@book_comment = BookComment.new
		@book_comments = @book.book_comments
	end

	def top
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
		flash[:notice] = "You have created book successfully"
		redirect_to @book
		else
		flash[:notice] = "error"
		@books = Book.all
		render 'index'
		end
	end

	def edit
		@book = Book.find(params[:id])
		if current_user.id != @book.user_id
		redirect_to books_path
		end
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:notice] = "successfully"
			redirect_to @book
		else
			render "edit"
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end




















