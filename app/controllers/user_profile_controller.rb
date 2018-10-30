class UserProfileController < ApplicationController
  before_action :find_user   
 
  def home
  	#@user = current_user
  	@reviews = @user.reviews.includes(comments: :user)
  	#binding.pry
	@reviews_like = Review.where(id: @user.likes.where(likeable_type: Review.name))
	@reviews_comment = @user.comments.map{|c| c.review}.uniq
  end
  
  
  def find_user
    @user = User.find(params[:id])
  end
end
