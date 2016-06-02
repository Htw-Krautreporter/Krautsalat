class PostsController < ApplicationController

	def create
		@topic = Topic.find(params[:topic_id])
		@post = @topic.posts.create(post_params)
		@post.user_id = current_user.id

		if @post.save
			redirect_to topic_path(@topic)
		else
			render 'new'
		end
	end

	private
		def post_params
			params.require(:post).permit(:content)
		end
end
