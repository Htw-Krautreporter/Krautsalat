class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :comments

  validates_presence_of :content, message:'Es muss Text im Beitrag enthalten sein.'
end
