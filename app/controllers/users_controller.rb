class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = Book.all
    @profile_image = User.find(params[:id])
    @book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
    flash[:update] = 'plofile was successfully updated.'
  end

  private
  	def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
