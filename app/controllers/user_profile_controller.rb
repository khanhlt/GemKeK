class UserProfileController < ApplicationController
  before_action :find_user   
 
  def home
  	#@user = current_user
  	@reviews = @user.reviews
  	#binding.pry
	@reviews_like = Like.show_liked_review(@user.id)
	@reviews_comment = @user.comments
  end
  
  
  def find_user
    @user = User.find(params[:id])
  end
end
