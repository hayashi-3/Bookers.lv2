class BooksController < ApplicationController
before_action :authenticate_user!
before_action :correct_user, only: [:edit, :update, :destroy]

    def correct_user
    book = Book.find(params[:id])
      if current_user != book.user
        redirect_to books_path
      end
    end

  # def user
  # #インスタンスメソッドないで、selfはインスタンス自身を表す
  #   return User.find_by(id: self.user_id)
  # end

  # def books
  #   return Book.where(user_id: self.id)
  # end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def new
    @book = Book.new
    @plofile_image = PlofileImage.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id=current_user.id
    if  @book.save
    flash.now[:notice] = 'Book was successfully created.'
    redirect_to book_path(@book.id)
    else
    @books = Book.all
    @user = current_user
    render :index
    end
  end

  def show
    @book_show = Book.find(params[:id])
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if@book.update(book_params)
    flash[:notice] = 'It was successfully updated.'
    redirect_to book_path(@book.id)
   else
    render :edit
  end
  end

  def plofile_image_id
    @profile_image = User.find(params[:id])
    @user = current_user
    if current_user.update(user_params)
    redirect_to user_path(@user.id)
   else
    render :index
  end
  end

  def destroy
  @book = Book.find(params[:id])
  @book.destroy
  @user = current_user
  flash[:notice] = 'Book was successfully destroy.'
  redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end