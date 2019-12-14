class PostCommentsController < ApplicationController
	def create
		post = Post.find(params[:post_comment][:post_id])
		#comment = current_user.post_comments.new(post_comment_params)
		#comment.post_image_id = post_image_id
		comment = PostComment.new(post_comment_params)
		if comment.save
			redirect_to post_path(post)
		else
            render :json => {'status' => 'ng'}
	    end
	end

	private
	def post_comment_params
		params.require(:post_comment).permit(:user_id,:post_id,:comment)
	end
end