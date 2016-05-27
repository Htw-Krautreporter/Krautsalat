class TopicsController < ApplicationController

	def index
	end

	def new
		@topic = Topic.new
	end

	def create
		@topic = Topic(topic_params)	
	end

	private

		def topic_params
			params.require(:topic).permit(:title, :description)
		end

end
