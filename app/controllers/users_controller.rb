class UsersController < ApplicationController
	skip_before_filter :require_no_authentication
	
	def show
		@user = User.find(params[:id])
	end
	
	def new
		authorize!
		@user = User.new(params[:user])
	end

	def create
		@user = User.new(params[:user])
		authorize! :create, @user

		if @user.save
			flash[:success] = "User Created"
			redirect_to root_path
		else
			render 'static_pages/home'
		end

	end

	def edit
		authorize! :update, @user
		@user = User.find(params[:id])
	end

	def update
		authorize! :update, @user
	    @user = User.find(params[:id])
	    if @user.update_attributes(params[:user])
	      flash[:success] = "Profile updated"
	      redirect_to root_path
	    else
	      render 'edit'
	    end
	 end

	def destroy
		authorize! :delete, @user
		
		if @user = User.find(params[:id]).destroy
			flash[:notice] = "User destroyed"
			redirect_to root_path
		end
	end
end
