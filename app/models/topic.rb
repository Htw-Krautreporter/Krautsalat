class Topic < ActiveRecord::Base
	belongs_to :users
	has_many :posts
end
