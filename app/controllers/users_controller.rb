class UsersController < ApplicationController
	def top
		@user = User.find(current_user.id)
	end
	def index
	end
	def show
		@user = User.find(params[:id])
	end
	def edit
		@user = User.find(current_user.id)
	end
	def update
		@user = User.find(current_user.id)
			if @user.update(user_params)
				redirect_to users_top_path
			else
				render :edit
			end
end
	private
	def user_params
		params.require(:user).permit(:username, :profile_image, :header_image, :email, :passwrd)
	end
end
