class Like < ApplicationRecord
    belongs_to :likeable, polymorphic: true
    belongs_to :user
    
    
    lambda_find_liked_review = lambda do |likeable_id, likeable_type, user_id|
        where likeable_id: likeable_id,
            likeable_type: likeable_type, user_id: user_id
    end
    
    lambda_show_liked_review = lambda do |user_id|
        where likeable_type: "Review", user_id: user_id
    end
    
    
    scope :find_liked_review, lambda_find_liked_review
    scope :show_liked_review, lambda_show_liked_review

end
