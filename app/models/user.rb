class User < ActiveRecord::Base
	has_many :posts
	has_many :comments
	has_and_belongs_to_many :topics

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :trackable, :validatable

	validates :username, uniqueness: true

	def self.search(search)
		where("email LIKE ? OR username LIKE ? OR expertise LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
	end
end