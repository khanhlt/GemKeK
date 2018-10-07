class Genre < ApplicationRecord
    has_many :game_genre, class_name: GameGenre.name, dependent: :destroy
    has_many :game_of_genre, through: :game_genre, source: :game
end
