class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates_presence_of :content, message:'Es muss Text im Kommentar enthalten sein.'
end
