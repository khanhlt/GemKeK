class Game < ApplicationRecord
  has_many :reviews
  has_many :photos , :dependent => :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true, reject_if: proc { |attributes| attributes['photo'].blank? }
  
  has_many :genre_game, class_name: GameGenre.name, dependent: :destroy
  has_many :genres_of_game, through: :genre_game, source: :genre
  has_many :platform_game, class_name: GamePlatform.name, dependent: :destroy
  has_many :platform_of_game, through: :platform_game, source: :platform

  validates :name, presence: true

  scope :just_published, -> number {where("relase_date < ?", Time.current).limit(number)}
  scope :upcoming, -> (number) {where("relase_date > ?", Time.current).limit(number)}

  def self.search(search)
    if search
      where('name LIKE ? OR summary LIKE ?', "%#{search}%", "%#{search}%").order('id DESC')
    else
      order('id DESC')
    end
  end
end
