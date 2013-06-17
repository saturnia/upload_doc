class DashboardController < ApplicationController
	before_filter :authenticate_user!

	def index
		@user = current_user
		#@uploads = @user.uploads.new
		@uploads = @user.uploads.new
		@feed_items = @user.feed #kanske :upload
	end

	def show
		@user = current_user
		@uploads = @user.uploads(params[:id])
		#@feed_items = @user.feed.(params[:id])

	end
end
