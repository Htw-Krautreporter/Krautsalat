class User < ActiveRecord::Base
	has_many :posts
	has_many :comments
	has_and_belongs_to_many :topics

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :trackable, :validatable

	validates_uniqueness_of :username, message: "Der Username ist bereits vergeben."
	validates_length_of :username, minimum: 3, too_short: "Der Username muss mindestens drei Zeichen enthalten."

	def self.search(search)
		where("email LIKE ? OR username LIKE ? OR expertise LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
	end
end