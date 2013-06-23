class UploadsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource  
  def create
    @user = current_user
  	@uploads = @user.uploads.new(params[:upload])
  	if @uploads.save
      flash[:notice] = "Document uploaded!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end

  end

  def destroy
    @user = current_user
    if @user.role == "admin"
      @upload = Upload.find(params[:id]).destroy
      redirect_to root_url
    end
  end 
end
