class Platform < ApplicationRecord
    has_many :game_platform, class_name: GamePlatform.name, dependent: :destroy
    has_many :game_of_platform, through: :game_platform, source: :game

    validates :name, uniqueness: { case_sensitive: false }
    
    def self.search(search)
        if search
            where('name LIKE ?', "%#{search}%").order('id DESC')
        else
            order('id DESC')
        end
    end
end
