class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@topic = Topic.fin(@post.topic_id)
		@comment = @post.comments.create(comment_params)
		@comment.user_id = current_user.id

		if @comment.save
			redirect_to message_path(@message)
		else 
			render 'new'
		end
	end

	private

		def comment_params
			params.recquire(:comment).permit(:content)
		end

end
