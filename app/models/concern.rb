class Concern < ApplicationRecord
	attachment :image
	belongs_to :user
	has_many :concern_comments, dependent: :destroy

	def self.search(search)
		if search
			Concern.where(['body LIKE ? OR title LIKE ?', "%#{search}%" , "%#{search}%"])
		else
			Concern.all
		end
	end
end
