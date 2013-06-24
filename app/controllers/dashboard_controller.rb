class DashboardController < ApplicationController
	#before_filter :authenticate_user!
	

	def index
		@user = current_user
		#@uploads = @user.uploads.new
		@uploads = @user.uploads.new
		#@feed_items = @user.feed
		# IF USER.ROLE == ADMIN 
			@feedall_items = @user.feedall
		# ELSE 
		# @FEEDALL_ITEMS  = @USER.FEEDALL.WHERE(PROTECTED: == FALSE) OR @USER.FEEDALL.USER_ID == ID

		@users = (current_user.blank? ? User.all : User.find(:all, :conditions => ["id != ?", current_user.id]))

	end

	def show
		@taggar = Upload.tagged_with(params[:search])
		@user = current_user
		if params[:tag]
			@uploads = @user.uploads.tagged_with(params[:tag])
		else
			@uploads = @user.uploads(params[:id])
		end
		#@feed_items = @user.feed.(params[:id])
	end
end
