class RankingsController < ApplicationController
	def index
		@dailyRanks = Post.find(Favorite.where(created_at:1.days.ago..Time.now).group(:post_id).order('count(post_id) desc').limit(10).pluck(:post_id))
		@weeklyRanks = Post.find(Favorite.where(created_at:1.weeks.ago..Time.now).group(:post_id).order('count(post_id) desc').limit(10).pluck(:post_id))
		@monthlyRanks = Post.find(Favorite.where(created_at:1.months.ago..Time.now).group(:post_id).order('count(post_id) desc').limit(10).pluck(:post_id))
	end
end
