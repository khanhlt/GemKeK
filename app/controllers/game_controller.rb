class GameController < ApplicationController
  before_action :get_game_upcomming
  before_action :find_game, only: [:add_bookmark, :undo_bookmark]
  def index
  
    @games = Game.all
    @game_top =
      Game.joins(:reviews)
        .group(:id)
        .select('id','name','summary','relase_date','avg(reviews.rating) as average_rating','count(reviews.rating) as count_rating')
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

  def  add_bookmark
    Bookmark.create user_id: current_user.id , game_id: params[:game_id]
    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.js { render 'game/bookmark.js.erb' }
    end
  end
  def  undo_bookmark
    Bookmark.where(user_id: current_user.id, game_id: params[:game_id]).delete_all
    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.js { render 'game/bookmark.js.erb' }
    end
  end

  private
  def find_game
    @game = Game.find params[:game_id]
  end
end
