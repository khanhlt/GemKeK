class Review < ApplicationRecord
    has_many :likes, as: :likeable, dependent: :destroy
    belongs_to :user
    belongs_to :game
    has_many :comments, dependent: :destroy
    
    def self.get_count_by_date(day_ago)
        if day_ago == 0
            return Review.where(created_at: Date.today.beginning_of_day .. Date.tomorrow.beginning_of_day).count
        else
            return Review.where(created_at: day_ago.day.ago.beginning_of_day .. (day_ago-1).day.ago.beginning_of_day).count
        end
    end
        
end
