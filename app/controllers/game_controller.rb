class GameController < ApplicationController
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
    @game_upcoming = Game.upcoming(5).includes(:photos)
  end
  
  def detail
    @game = Game.find_by_id(params[:id])
  end
end
