module ApplicationHelper
  def get_rating_reivew review
     return 0 if review.rating.nil?
     return review.rating.round(1)
  end

  def get_rate_average game
    game.reviews.average(:rating).nil? ? 0 : game.reviews.average(:rating).round(1)
  end
end
