class TopicsController < ApplicationController
	before_action :find_topic, only: [:show, :edit, :update, :destroy]

	def index
		@topics = Topic.all.order("created_at DESC")
	end

	def show
		@time = timeToString
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

		def timeToString
			@time = @topic.created_at.in_time_zone("Berlin")
			@day = @time.day < 10 ? "0#{@time.day}" : @time.day
			@month = @time.month < 10 ? "0#{@time.month}" : @time.month
			"#{@day}.#{@month}.#{@time.year} um #{@time.hour}:#{@time.min} Uhr"
		end

end
