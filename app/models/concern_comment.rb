class ConcernComment < ApplicationRecord
	belongs_to :user
	belongs_to :concern
	validates :comment, presence: true
end
