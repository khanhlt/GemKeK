class GameController < ApplicationController
  def index
    @games = Game.all

    @game_full = []
    @games.each do |game|
      game_ = {"image": game.photos.first.image,
               "name": game.name, "id": game.id, "summary": game.summary, "release_date": game.relase_date,
               "score": game.reviews.average(:rating),
               "platform": game.platform_of_game}
      @game_full.push(game_)
    end

    @game_full = @game_full.sort_by!{ |x| x[:score]}.reverse
    @game_news = Game.just_published(5).includes(:photos)
    @game_upcoming = Game.upcoming(5).includes(:photos)
end

end
