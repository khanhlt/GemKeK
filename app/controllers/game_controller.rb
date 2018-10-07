class GameController < ApplicationController
  def index
    @games = Game.all

    @game_full = []
    @games.each do |game|
      game_ = {"image": Photo.where(game_id: game.id).first.image,
               "name": game.name, "id": game.id, "summary": game.summary, "release_date": game.relase_date,
               "score": Review.where(game_id: game.id).average(:rating),
               "platform": Platform.where(id: GamePlatform.where(game_id: game.id))}
      @game_full.push(game_)
    end

    @game_full = @game_full.sort_by!{ |x| x[:score]}.reverse
  end

end
