class FavoritesController < ApplicationController

	def index
    @favorite_books = current_user.favorite_books
    end

	def create
	@book = Book.find(params[:book_id])
    @favorite = current_user.favorites.new(book_id: @book.id)
    @favorite.save
    redirect_to book_path(@book)
	end

	def destroy
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: @book.id)
    favorite.destroy
    redirect_to book_path(@book)
	end
end
