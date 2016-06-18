class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@topic = Topic.find(@post.topic_id)
		@comment = @post.comments.create(comment_params)
		@comment.user_id = current_user.id

		if @comment.save
			redirect_to topic_path(@topic)
		else 
			render 'new'
		end
	end

	private

		def comment_params
			params.require(:comment).permit(:content)
		end

end
