class PostCommentsController < ApplicationController
	before_action :authenticate_user!
	def create
		@post = Post.find(params[:post_comment][:post_id])
		@user_id = current_user.id
		@post_comment = PostComment.new(post_comment_params)
		if @post_comment.save
		   redirect_to post_path(@post)
		else
			@post_comments = PostComment.all
			render "posts/show"
		end
	end

	private
	def post_comment_params
		params.require(:post_comment).permit(:user_id,:post_id,:comment)
	end
end