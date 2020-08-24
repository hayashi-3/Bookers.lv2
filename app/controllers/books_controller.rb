class BooksController < ApplicationController
before_action :authenticate_user!

def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id=current_user.id
    @book.save
    redirect_to book_path(@book)
    flash[:notice] = 'Book was successfully created.'
  end

  def show
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(book)
    flash[:update] = 'Book was successfully updated.'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end