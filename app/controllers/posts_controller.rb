class PostsController < ApplicationController
	PER = 4
	
	def index
		@posts = Post.all
		if params[:tag]
			@posts = Post.tagged_with(params[:tag])
		else
			@posts = Post.page(params[:page]).per(PER)
		end
		@dailyRanks = Post.find(Favorite.where(created_at:1.days.ago..Time.now).group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
	end

	def show
		@post = Post.find(params[:id])
		@user_id = current_user.id
		@post_comment = PostComment.new
		@post_comments = PostComment.all
	end

	def new
		@posts = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		@post.save
		redirect_to posts_path
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	private
	    def post_params
	        params.require(:post).permit(:title, :image, :body, :tag_list,:video)
	    end

end
