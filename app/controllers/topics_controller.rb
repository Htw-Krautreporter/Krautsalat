class TopicsController < ApplicationController
	before_action :find_topic, only: [:show, :edit, :update, :destroy, :manage_users, :invite_user, :invite_all_filtered_users]
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

	def manage_users
		@related_users = @topic.users.order('created_at DESC')
		searched_users = User.search(params[:search]).order("created_at DESC")
		@filtered_users = searched_users.select { |user| !@related_users.include?(user)}
	end

	def invite_user
		user = User.find(params[:user_id])
		@topic.users << user unless @topic.users.include?(user)
		save_users_and_redirect(@topic)
	end

	def invite_all_filtered_users
		params[:filtered_users].each do |user_id|
			user = User.find(user_id)
			@topic.users << user unless @topic.users.include?(user)
		end
		save_users_and_redirect(@topic)
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

		def save_users_and_redirect(topic)
			if topic.save
				redirect_to manage_users_path
			else
				render 'manage_users'
			end
		end

end
