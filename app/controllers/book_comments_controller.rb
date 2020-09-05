class BookCommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@book = Book.find(params[:book_id])
		@book_comment = current_user.book_comments.new(book_comment_params)
		@book_comment.book_id = @book.id
	 if @book_comment.save
	 	flash[:success] = "Comment was successfully created."
	    redirect_back(fallback_location: book_path(@book))
	 else
		redirect_to book_path(@book)
		flash[:notice] = 'Please,enter the comment.'
	 end
	end

	def destroy
		book = Book.find(params[:book_id])
		book_comment = current_user.book_comments.find_by(@book)
		book_comment.destroy
	    redirect_back(fallback_location: book_path(book))
	end

	private

	def book_comment_params
		params.require(:book_comment).permit(:comment, :book_id)
	end

end
