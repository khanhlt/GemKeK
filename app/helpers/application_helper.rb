module ApplicationHelper
  def get_rating_reivew review
     return 0 if review.rating.nil?
     return review.rating.round(1)
    end
end
