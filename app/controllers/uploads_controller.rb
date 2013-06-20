class UploadsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource  
  def create
    @user = current_user
  	@uploads = @user.uploads.new(params[:upload])
  	if @uploads.save
      flash[:notice] = "Document uploaded!"
      redirect_to root_url #:controller=>'dashboard', :action => 'show'
    else
      @feed_items = []
      render 'static_pages/home'
    end



  	#redirect_to :controller=>'dashboard', :action => 'index'
  end

  def destroy
    @user = current_user
    if @user.role == "admin" || "user"
      @upload = Upload.find(params[:id]).destroy
      redirect_to root_url
    end
  end

  

end
