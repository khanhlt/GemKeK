class Comment < ApplicationRecord
    has_many :likes, as: :likeable
    belongs_to :user
    belongs_to :review
end
