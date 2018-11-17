class Genre < ApplicationRecord
    has_many :game_genre, class_name: GameGenre.name, dependent: :destroy
    has_many :game_of_genre, through: :game_genre, source: :game, dependent: :destroy

    validates :name, uniqueness: { case_sensitive: false }

    def self.search(search)
        if search
            where('name LIKE ?',"%#{search}%").order('id DESC')
        else
            order('id DESC')
        end
    end
end
