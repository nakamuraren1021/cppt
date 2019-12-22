class ConcernCommentsController < ApplicationController
	before_action :authenticate_user!
	def create
		@concern = Concern.find(params[:concern_id])
		@concern_comment = ConcernComment.new(concern_comment_params)
		@concern_comment.user_id = current_user.id
		@concern_comment.concern_id = @concern.id
		if @concern_comment.save
			redirect_to concern_path(@concern)
		else
			render  "concerns/show"
		end
	end
	private
	def concern_comment_params
		params.require(:concern_comment).permit(:user_id,:concern_id,:comment)
	end
end


