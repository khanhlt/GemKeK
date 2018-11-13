class Manage::PlatformsController < ApplicationController
layout "manage/home"
before_action :find_platform , only: [:destroy, :edit, :update]
	def index
    	@platforms = Platform.all().order(created_at: :desc)
  	end

  def new
   
    @platform = Platform.new
    respond_to do |format|
       format.js { render partial: "form",locals: {platform: @platform}} 
    end     
  end
  def create
    #binding.pry
    @platform = Platform.new (platform_params)
    if @platform.save
      flash[:success] = "Create success"
      redirect_to manage_platforms_path
    else
   
      flash[:danger] = "Create error: " + @platform.errors.full_messages[0]
      redirect_to manage_platforms_path   
    end    
  end

  def edit
  	respond_to do |format|
    format.js { render partial: "form", locals: {platform: @platform}}
    end
  end

  def update
    #binding.pry
    if @platform.update_attributes platform_params 
      flash[:success] = "Update success"
      redirect_to manage_platforms_path 
    else  
      render :edit
    end  
  end

  def destroy
    @platform.destroy
    flash[:success] = "Delete success"
    redirect_to manage_platforms_path
  end

  private
  def find_platform
  	@platform = Platform.find(params[:id])
  end

  def platform_params
    params.require(:platform).permit(:name)
  end
end
