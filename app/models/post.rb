class Post < ApplicationRecord
	belongs_to :user
	attachment :image
	acts_as_taggable
	has_many :post_comments,dependent: :destroy
	has_many :favorites,dependent: :destroy
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
	mount_uploader :video, VideoUploader
end
