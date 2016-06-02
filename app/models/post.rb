class Post < ActiveRecord::Base
  belongs_to :topics
  belongs_to :users
end
