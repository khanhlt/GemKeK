class GameController < ApplicationController
  before_action :get_game_upcomming

  def index
  
    @games = Game.all

    @game_top = []
    @games.each do |game|
      if (game.reviews.average(:rating) != nil)
        @game_top.push(game)
      end
    end

    @game_top = 
      Game.joins(:reviews)
        .group(:id)
        .select('id','name','summary','relase_date','avg(reviews.rating) as average_rating')
        .paginate(:page => params[:page], :per_page => 5)
        .order('average_rating desc')

    @game_news = Game.just_published(5).includes(:photos)
    if user_signed_in?
      @review = current_user.reviews.build
    end
  end
  
  def detail
    @game = Game.find(params[:id])
    @game_related = []
    @game.platform_of_game.each do |t|
      t.game_of_platform.each do |k|
        @game_related.push(k)
      end
    end
    @game.genres_of_game.each do |t|
      t.game_of_genre.each do |k|
        @game_related.push(k)
      end
    end
    @game_related.delete(@game)
    @game_related = @game_related.uniq
  end

  def game_list_of_platform
    @game_list = nil
    platform = Platform.find_by_name(params[:platform])
    if (platform != nil)
      @game_list = platform.game_of_platform
      @game_list = @game_list.sort_by {|x| x.reviews.average(:rating) or 0}.reverse.paginate(:page => params[:page], :per_page => 5)
    end
  end

  def game_list_of_genre
    @game_list = nil
    genre = Genre.find_by_name(params[:genre])
    if (genre != nil)
      @game_list = genre.game_of_genre
      @game_list = @game_list.sort_by {|x| x.reviews.average(:rating) or 0}.reverse.paginate(:page => params[:page], :per_page => 5)
    end
  end

  def get_game_upcomming
    @game_upcoming = Game.upcoming(5).includes(:photos)
  end

end
