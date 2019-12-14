class ConcernCommentsController < ApplicationController
	def create
		concern = Concern.find(params[:concern_id])
		comment = ConcernComment.new(concern_comment_params)
		comment.user_id = current_user.id
		comment.concern_id = concern.id
		comment.save
		redirect_to concern_path(concern)
	end
	private
	def concern_comment_params
		params.require(:concern_comment).permit(:user_id,:concern_id,:comment)
	end
end


