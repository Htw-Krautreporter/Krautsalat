class CommentsController < ApplicationController
	before_action :find_parents
	before_action :find_comment, only: [:edit, :update, :destroy]

	def create
		@comment = @post.comments.create(comment_params)
		@comment.user_id = current_user.id
		@comment.save
		redirect_to topic_path(@topic)
	end

	def edit
	end

	def update
		if @comment.update(comment_params)
			redirect_to topic_path(@topic)
		else
			render 'edit'
		end
	end

	def destroy
		@comment.destroy
		redirect_to topic_path(@topic)
	end

	private

		def comment_params
			params.require(:comment).permit(:content)
		end

		def find_comment
			@comment = @post.comments.find(params[:id])
		end

		def find_parents
			@post = Post.find(params[:post_id])
			@topic = Topic.find(@post.topic_id)
		end

end
