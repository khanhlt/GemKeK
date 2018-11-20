class UserProfileController < ApplicationController
  before_action :find_user   
 
  def home
  	#@user = current_user
  	@reviews = @user.reviews.order("created_at DESC").paginate page: params[:page], per_page: 3
	  @reviews_like = Like.show_liked_review(@user.id).order("created_at DESC").paginate page: params[:page], per_page: 3
	  @reviews_comment = @user.comments.order("created_at DESC").paginate page: params[:page], per_page: 3
	  respond_to do |format|
      format.html
      format.js
    end
  end
  
  
  def find_user
    @user = User.find(params[:id])
  end
end
