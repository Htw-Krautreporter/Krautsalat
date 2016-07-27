class PostsController < ApplicationController
	respond_to :html, :json
	before_action :find_topic
	before_action :find_post, only: [:edit, :update, :destroy]

	def show
	end

	def create
		@post = @topic.posts.create(post_params)
		@post.user_id = current_user.id
		if @post.save
			redirect_to topic_path(@topic)
		else
			redirect_to topic_path(@topic), alert: "Keine leeren Beiträge möglich!"		
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to topic_path(@topic)
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to topic_path(@topic)
	end

	private

		def post_params
			params.require(:post).permit(:content, :linkUrl, :linkText, :imageUrl)
		end

		def find_topic
			@topic = Topic.find(params[:topic_id])
		end 

		def find_post
			@post = @topic.posts.find(params[:id])
		end

end
