class BookCommentsController < ApplicationController
before_action :correct_user, only: [:destroy]

	def correct_user
		book = Book.find(params[:book_id])
    	book_comment = BookComment.find(params[:book_id])
     if current_user != book_comment.user
        redirect_back(fallback_location: book_path(book))
      end
    end

	def create
		@book = Book.find(params[:book_id])
	    @book_comment = Book.new
	    @comment = @book.book_comments.new(book_comment_params)
	    @comment.user_id = current_user.id
	 if @comment.save
	    redirect_to book_path(@book)
	 else
		redirect_back(fallback_location: book_path(@book))
	 end
	end

	def destroy
		book_comment.book = Book.find(params[:book_id])
		book_comment = BookComment.find(params[:book_id])
		@comment.user_id = correct_user.id
		BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
	    redirect_back(fallback_location: book_path(book))
	end

	private

	def book_comment_params
		params.require(:book_comment).permit(:comment, :book_id)
	end

end
