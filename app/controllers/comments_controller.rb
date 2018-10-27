class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :edit]
  # before_action :set_comment, only: [:show, :edit, :update, :destroy]
  # before_action :correct_user, only: [:update, :destroy]
  # skip_before_action :verify_authenticity_token

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    @review = Review.find(params[:review_id])
    @comment = Comment.find(params[:comment_id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @review = Review.find(params[:review_id])
    @comment = @review.comments.new comment_params
    @comment.user_id = current_user.id

    if @comment.save
      respond_to do |format|
        format.html { redirect_to request.referrer }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to request.referrer, notice: 'comment was unsuccessfully posted.' }
        format.js
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  # def update
  #   @comment = Comment.find(params[:id])
  #   if @comment.update_attributes comment_params
  #     flash[:notice] = "Successfully updated post!"
  #     redirect_to review_path(id: params[:review_id], method: :show)
  #   else
  #     flash[:alert] = "Error updating post!"
  #     render :edit
  #   end
  # end

  def update
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Edit was successfully updated.' }
        format.json { head :no_content } # 204 No Content
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:comment_id])
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
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:comment_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit :content
    end
end
