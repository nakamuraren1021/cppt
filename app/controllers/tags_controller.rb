class TagsController < ApplicationController
	def index
		if params[:tag]
			@tag = Tag.where(name: params[:tag]).first
			@posts = Post.tagged_with(params[:tag])
		else
			@posts = Post.all
		end
	end
end
