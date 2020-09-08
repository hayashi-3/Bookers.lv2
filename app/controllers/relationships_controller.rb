class RelationshipsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user

  	def index
  		@users = @user.followings.all
  	end

  	def show
  		@users = @user.followers.all
  	end

	def create
	 if current_user.follow(@user)
	 	redirect_back(fallback_location: root_path)
	 else
		redirect_back(fallback_location: root_path)
	 end
	end

	def destroy
	 if current_user.unfollow(@user)
	 	redirect_back(fallback_location: root_path)
	 else
		redirect_back(fallback_location: root_path)
	 end
	end

	private
	 def set_user
	  @user = User.find(params[:id])
	 end

end
