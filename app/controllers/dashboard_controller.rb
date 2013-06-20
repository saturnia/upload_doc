class DashboardController < ApplicationController
	#before_filter :authenticate_user!
	

	def index
		@user = current_user
		#@uploads = @user.uploads.new
		@uploads = @user.uploads.new
		@feed_items = @user.feed
		@feedall_items = @user.feedall
		#@users = User.all
		@users = (current_user.blank? ? User.all : User.find(:all, :conditions => ["id != ?", current_user.id]))

	end

	def show
		@user = current_user
		if params[:tag]
			@uploads = @user.uploads.tagged_with(params[:tag])
		else
			@uploads = @user.uploads(params[:id])
		end
		#@feed_items = @user.feed.(params[:id])
	end
end
