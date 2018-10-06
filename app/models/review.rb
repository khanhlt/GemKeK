class Review < ApplicationRecord
    has_many :likes, as: :likeable
end
