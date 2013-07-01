class DashboardController < ApplicationController
	#before_filter :authenticate_user!
	

	def index
		@user = current_user
		@uploads = @user.uploads.new
		# IF USER.ROLE == ADMIN 
			@feedall_items = @user.feedall
		# ELSE 
		# @FEEDALL_ITEMS  = @USER.FEEDALL.WHERE(PROTECTED: == FALSE) OR @USER.FEEDALL.USER_ID == ID

		@users = (current_user.blank? ? User.all : User.find(:all, :conditions => ["id != ?", current_user.id]))

	end

	def show
		@user = current_user
		if params[:tag]
			@uploads = Upload.tagged_with(params[:tag])
		else
			@uploads = @user.uploads(params[:id])
		end
	end
end
