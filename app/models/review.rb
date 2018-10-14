class Review < ApplicationRecord
    has_many :likes, as: :likeable
    belongs_to :user
    has_many :comments
end
