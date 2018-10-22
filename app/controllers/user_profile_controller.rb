class UserProfileController < ApplicationController
  def home
  	@user = current_user
  	@reviews = @user.reviews.includes(comments: :user)
  	#binding.pry
	@reviews_like = Review.where(id: @user.likes.where(likeable_type: Review.name))
	@reviews_comment = @user.comments.map{|c| c.review}.uniq
  end
end
