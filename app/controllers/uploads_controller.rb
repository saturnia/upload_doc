class UploadsController < ApplicationController
  def create
    @user = current_user
  	@uploads = @user.uploads.new(params[:upload])
  	if @uploads.save
      flash[:notice] = "Document uploaded!"
      redirect_to :controller=>'dashboard', :action => 'show'
    else
      render 'static_pages/home'
    end



  	#redirect_to :controller=>'dashboard', :action => 'index'
  end

  def destroy
  end
end
