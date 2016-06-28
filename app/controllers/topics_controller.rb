class TopicsController < ApplicationController
	before_action :find_topic, only: [:show, :edit, :update, :destroy]
	before_action :find_posts, only: [:show]
	before_action :authenticate_user! 

	def index
		@own_topics  = Topic.where(user_id: current_user.id).order("created_at DESC")
		if current_user.admin?
			@topics = Topic.all.order("created_at DESC")
		else
			@topics = current_user.topics.order("created_at DESC")
		end
	end

	def show
		unless current_user == @topic.user || current_user.admin? || @topic.users.include?(current_user)
			redirect_to topics_path
		end
	end

	def new
		@topic = current_user.topics.build
	end

	def create
		@topic = current_user.topics.build(topic_params)
		@topic.user_id = current_user.id
		
		if @topic.save
			redirect_to topics_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @topic.update(topic_params)
			redirect_to topic_path
		else
			render 'edit'
		end
	end

	def destroy
		@topic.destroy
		redirect_to topics_path
	end

	private

		def topic_params
			params.require(:topic).permit(:title, :description)
		end

		def find_topic
			@topic = Topic.find(params[:id])
		end

		def find_posts
			@posts = Post.where("topic_id = ?", params[:id])
		end

end
