class Like < ApplicationRecord
    belongs_to :likeable, polymorphic: true
    
    lambda_find_liked_review = lambda do |likeable_id, likeable_type, user_id|
        where likeable_id: likeable_id,
            likeable_type: likeable_type, user_id: user_id
    end
    
    scope :find_liked_review, lambda_find_liked_review
end
