module TopicsHelper

	def count_new_posts_and_comments(topic)
		numberOfNewPostsAndComments = 0
		visit = Visit.where("topic_id = ? AND user_id =?", topic.id, current_user.id).take
		if visit == nil
			topic.posts.each do |post|
				numberOfNewPostsAndComments += (1 + post.comments.count) 
			end
		else
			visited_at = visit.visited_at
			topic.posts.each do |post|
				if visited_at < post.created_at
					numberOfNewPostsAndComments += 1
				end
				post.comments.each do |comment|
					if visited_at < comment.created_at
						numberOfNewPostsAndComments += 1
					end
				end
			end
		end
		return numberOfNewPostsAndComments
	end

end
