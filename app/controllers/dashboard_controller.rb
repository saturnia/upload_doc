class DashboardController < ApplicationController
	before_filter :authenticate_user!

	
	def show
		@user = User.find(params[:id])
	end
	
	def index

	end
end
