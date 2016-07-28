class RightsController < ApplicationController

	def show
		@users = User.search(params[:search]).order('username')
		@rights = [0, 1, 2]
	end

	def edit
		# user = User.find(params[:user_id])
		# user.rights = params[:user_rights]
		# if user.save
		# 	redirect_to rights_path
		# else
		# 	render 'show'
		# end
	end

end
