class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_review

  def create
    @like = current_user.likes.new 
    like.likeable_id = params[:likeable_id]
    like.likeable_type = params[:likeable_type]
    if like.save
      respond_to do |format|
        format.html { redirect_to request.referrer }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to request.referrer }
        format.js
      end
    end
        #flash[:notice] = "Successfully like!"
        #redirect_to  request.referrer
  end

  def destroy
    @like = Like.find_liked_review(params[:likeable_id],
    params[:likeable_type], current_user.id).first
    if like.destroy
      respond_to do |format|
        format.html { redirect_to request.referrer }
        format.js
      end
    end
  end

  private

  attr_reader :like

  def find_review
    if params[:likeable_type] == "Review"
      @object = Review.find_by id: params[:likeable_id]
    else
      @object = Comment.find_by id: params[:likeable_id]
    end
  end
end