class Manage::ReviewsController < ApplicationController
  before_action :check_admin
  before_action :find_review, :only => [:destroy]
  layout "manage/home"

  def index
    @reviews = Review.all.order(created_at: :desc)
  end

  def destroy
    @review.destroy
    flash[:success] = "Delete success"
    redirect_to manage_reviews_path
  end

  private
  def check_admin
    unless current_user.is_admin?
      flash[:danger] = t ".not_permission"
    end
  end

  def find_review
    @review = Review.find(params[:id])
  end
end