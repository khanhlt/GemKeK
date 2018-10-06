class Game < ApplicationRecord
    has_many :reviews
    has_many :photos
    has_many :genre_game, class_name: GameGenre.name, dependent: :destroy
    has_many :genres_of_game, through: :genre_game, source: :genre
    has_many :platform_game, class_name: GamePlatform.name, dependent: :destroy
    has_many :platform_of_game, through: :platform_game, source: :platform
end
