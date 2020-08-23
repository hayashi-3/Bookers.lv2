class BooksController < ApplicationController
before_action :authenticate_user!

  def new
    @book = book.new
  end

  def create
    @book = book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path
    flash[:notice] = 'Book was successfully created.'
  end

#updateに書く
#flash[:update] = 'Book was successfully updated.'

  def index
  end

  def show
    @book = Book.all
  end

  def edit
    @book = book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end