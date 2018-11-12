class Manage::GenresController < ApplicationController
layout "manage/home"
before_action :find_genre , only: [:destroy, :edit, :update]
	def index
    	@genres = Genre.all().order(created_at: :desc)
  	end

  def new
    #binding.pry
    @genre = Genre.new
    respond_to do |format|
       format.js { render partial: "form",locals: {genre: @genre}} 
    end     
  end
  def create
    #binding.pry
    @genre = Genre.new (genre_params)
    if @genre.save
      flash[:success] = "Create success"
      redirect_to manage_genres_path
    else
   
      flash[:danger] = "Create error: " + @genre.errors.full_messages[0]
      redirect_to manage_genres_path   
    end    
  end

  def edit
  	respond_to do |format|
    format.js { render partial: "form", locals: {genre: @genre}}
    end
  end

  def update
    #binding.pry
    if @genre.update_attributes genre_params 
      flash[:success] = "Update success"
      redirect_to manage_genres_path 
    else  
      render :edit
    end  
  end

  def destroy
    @genre.destroy
    flash[:success] = "Delete success"
    redirect_to manage_genres_path
  end

  private
  def find_genre
  	@genre = Genre.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:name)
  end
end
