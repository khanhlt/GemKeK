class Manage::GamesController < ApplicationController
  layout "manage/home"
  before_action :find_game , only: [:destroy, :edit, :update]

  def index
    @games = Game.includes(:genre_game, :genres_of_game,:platform_game,:platform_of_game).all()
  end

  def new
    #binding.pry
    @game = Game.new
    respond_to do |format|
       format.js { render partial: "form",locals: {game: @game}} 
    end     
  end
  def create
    #binding.pry
    @game = Game.new (game_params)
    if @game.save 
      flash[:success] = "Create success"
      redirect_to manage_games_path
    else
   
      flash[:danger] = "Create error: " + @game.errors.full_messages[0]
      redirect_to manage_games_path   
    end    
  end

  def edit
  	respond_to do |format|
    format.js { render partial: "form", locals: {game: @game}}
    end
  end

  def update
    if @game.update_attributes game_params
      flash[:success] = "Update success"
      redirect_to manage_games_path 
    else  
      render :edit
    end  
  end

  def destroy
    @game.destroy
    flash[:success] = "Delete success"
    redirect_to manage_games_path
  end

  def search_game
    @games = Game.search(params[:search_game])
    @genres = Genre.search(params[:search_game])
    @platforms = Platform.search(params[:search_game])

    @search_results = []
    @games.each do |game|
      @search_results.push(game)
    end

    @genres.each do |genre|
      genre.game_of_genre.each do |g|
        @search_results.push(g)
      end
    end

    @platforms.each do |platform|
      platform.game_of_platform.each do |g|
        @search_results.push(g)
      end
    end

    @search_results = @search_results.uniq
  end

  private
  def find_game
  	@game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :summary, genres_of_game_ids: [], platform_of_game_ids: [])
  end
end
