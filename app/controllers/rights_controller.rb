class RightsController < ApplicationController

	def show
		@users = User.search(params[:search]).order('username')
	end

	def update_rights
		user = User.find(params[:user_id])
		user.rights = params[:right_level]
		if user.save
			redirect_to rights_path
		else
			render 'show'
		end
	end

end
