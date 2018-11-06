class UserProfileController < ApplicationController
  before_action :find_user   
 
  def home
  	#@user = current_user
  	@reviews = @user.reviews.order("created_at DESC")
  	#binding.pry
	  @reviews_like = Like.show_liked_review(@user.id).order("created_at DESC")
	  @reviews_comment = @user.comments.order("created_at DESC")
  end
  
  
  def find_user
    @user = User.find(params[:id])
  end
end
