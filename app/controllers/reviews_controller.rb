class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :edit]
  before_action :find_review, only: [:update, :destroy, :edit]
  before_action :correct_user, only: [:update, :destroy]
  skip_before_action :verify_authenticity_token


  def index
  end


  def create
    @review = current_user.reviews.new review_params
    @review.game_id = params[:game_id]
    if review.save
      flash[:success] = "review created!"
      redirect_to request.referrer
    else
      flash[:danger] = "Fail"
    end
  end

  def edit
    respond_to do |format|
    format.js { render partial: "form", locals: {review: @review}}
  end
  end

  # Update action updates the post with the new information
  def update
    if @review.update_attributes review_params
      flash[:notice] = "Successfully updated post!"
      redirect_to request.referrer
    else
      flash[:alert] = "Error updating post!"
      render :edit
    end
  end

  def show
    @review = Review.find(params[:id])
    @game = Game.find(@review.game_id)
  end

  def destroy
    if review.destroy
      flash[:notice] = "Successfully deleted review!"
      redirect_to request.referrer
    else
      flash[:alert] = "Error updating post!"
    end
  end

  def rate
    @reviews = current_user.reviews
    if (@reviews.where(game_id: params[:game_id]).count > 0)
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

  def destroy
    @review.destroy
    
    redirect_to user_profile_home_path id: params[:user_id]
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
