class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :edit]

  def new
    @review = current_user.reviews.new
  end

  def create
      @review = current_user.reviews.new review_params
      review.game_id = params[:game_id]
    if review.save
      flash[:success] = "review created!"
      redirect_to game_detail_path(id: @review.game_id)
    else
      flash[:danger] = "Fail"
    end
  end

  def destroy
  end
  
  private
  
  attr_reader :review

  def review_params
    params.require(:review).permit :content, :title, :rating
  end
end
