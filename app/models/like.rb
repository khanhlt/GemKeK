class Like < ApplicationRecord
    belongs_to :likeable, polymorphic: true
    
    lambda_find_liked_review = lambda do |user_id|
        where user_id: user_id, likeable_type: "Review"
    end
    
    scope :find_liked_review, lambda_find_liked_review
end
