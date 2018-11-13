class Manage::CommentsController < ApplicationController
  before_action :check_admin
  before_action :find_comment, :only => [:destroy]
  layout "manage/home"

  def destroy
    # @comment.destroy
    # flash[:success] = "Delete success"
    # redirect_to review_path

    @comment = Comment.find(params[:id])
    @review = @comment.review
    if @comment.destroy
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
  end

  private
  def check_admin
    unless current_user.is_admin?
      flash[:danger] = t ".not_permission"
    end
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end
end