class ConcernsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]
	PER = 10

	def new
		@concern = Concern.new
	end

	def index
		@concerns = Concern.page(params[:page]).per(PER)
	end

	def show
		@concern = Concern.find(params[:id])
		@concern_comment = ConcernComment.new
	end

	def search
		@concerns = Concern.search(params[:search]).page(params[:page]).per(PER)
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
		redirect_to search_path
	end

 private
 def concern_params
 	params.require(:concern).permit(:title, :body, :image)
 end

end
