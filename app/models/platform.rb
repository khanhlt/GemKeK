class Platform < ApplicationRecord
    has_many :game_platform, class_name: GamePlatform.name, dependent: :destroy
    has_many :game_of_platform, through: :game_platform, source: :game
end
