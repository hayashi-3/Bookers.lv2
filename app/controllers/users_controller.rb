class UsersController < ApplicationController

  def user
  #インスタンスメソッドないで、selfはインスタンス自身を表す
    return User.find_by(id: self.user_id)
  end

  def books
    return Book.where(user_id: self.id)
  end

  def index
    @book = Book.new
    @users = User.all
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
    @book = Book.new
    @users = User.all
    @user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user == current_user
  if@user.update(user_params)
    flash[:update] = 'It was successfully updated.'
    redirect_to user_path(@user)
   else
    render :edit
  end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    @user = current_user
    flash[:notice]="Book was successfully deleted."
    redirect_to books_path
  end

  private
  	def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end