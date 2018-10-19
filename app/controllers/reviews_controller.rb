class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :edit]
  before_action :find_review, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  skip_before_action :verify_authenticity_token


  def index
  end
  
  def new
    @review = current_user.reviews.new
  end

  def create
      @review = current_user.reviews.new review_params
      @review.game_id = params[:game_id]
    if review.save
      flash[:success] = "review created!"
      redirect_to game_detail_path(id: @review.game_id)
    else
      flash[:danger] = "Fail"
    end
  end
  
  def edit
  end

  # Update action updates the post with the new information
  def update
    if @review.update_attributes review_params
      flash[:notice] = "Successfully updated post!"
      redirect_to game_detail_path(id: @review.game_id)
    else
      flash[:alert] = "Error updating post!"
      render :edit
    end
  end
  
  def show
  end
  
  def destroy
    game_id = @review.game_id
    if review.destroy
      flash[:notice] = "Successfully deleted review!"
      redirect_to game_detail_path(id: game_id)
    else
      flash[:alert] = "Error updating post!"
    end
  end

  def rate
    @reviews = current_user.reviews 
    if(@reviews.where(game_id: params[:game_id]).count >0)
      review = @reviews.where(game_id: params[:game_id]).first
    else
      review = current_user.reviews.new review_params
      review.game_id = params[:game_id]
    end  
    review.rating = params.require(:review)[:rating]
      
    if review.save
      flash[:success] = "review created!"
    else
      flash[:danger] = "Fail"
    end
  end
  
  private
  
  attr_reader :review

  def review_params
    params.require(:review).permit :content, :title, :rating
  end
  
  def find_review
    @review = Review.find(params[:id])
  end
  
  def correct_user
      @review = current_user.reviews.find_by(id: params[:id])
      redirect_to root_url if @review.nil?
  end
  
    
end
