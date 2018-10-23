class GameController < ApplicationController
  before_action :get_game_upcomming, only: [:index, :detail]

  def index
    @games = Game.all

    @game_top = []
    @games.each do |game|
      if (game.reviews.average(:rating) != nil)
        @game_top.push(game)
      end
    end

    @game_top = @game_top.sort_by! {|x| x.reviews.average(:rating)}.reverse
    @game_news = Game.just_published(5).includes(:photos)
    if user_signed_in?
      @review = current_user.reviews.build
    end
  end
  
  def detail
    @game = Game.find_by_id(params[:id])
  end

  def get_game_upcomming
    @game_upcoming = Game.upcoming(5).includes(:photos)
  end
end
