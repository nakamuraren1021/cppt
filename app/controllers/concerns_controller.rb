class ConcernsController < ApplicationController
	def new
		@concern = Concern.new
	end

	def index
		@concerns = Concern.all
	end

	def show
		@concern = Concern.find(params[:id])
		@user = User.find(@concern.user_id)
		@concern_comment = ConcernComment.new
	end

	def search
		@concerns = Concern.search(params[:search])
	end

	def create
		@concern = Concern.new(concern_params)
		@concern.user_id = current_user.id
		@concern.save
		redirect_to search_path
	end

	def destroy
		@concern = Concern.find(params[:id])
		@concern.destroy
		redirect_to concerns_path
	end

 private
 def concern_params
 	params.require(:concern).permit(:title, :body, :image)
 end

end
