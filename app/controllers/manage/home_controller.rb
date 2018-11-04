class Manage::HomeController < ApplicationController
    before_action :authenticate_user!, :check_admin
    def index

        @data = {
            labels: [Date.today, 1.day.ago.to_date, 2.day.ago.to_date, 3.day.ago.to_date, 4.day.ago.to_date, 5.day.ago.to_date, 6.day.ago.to_date].reverse,
            datasets: [{data:[
                Review.get_count_by_date(0),
                Review.get_count_by_date(1),
                Review.get_count_by_date(2),
                Review.get_count_by_date(3),
                Review.get_count_by_date(4),
                Review.get_count_by_date(5),
                Review.get_count_by_date(6)].reverse}
            ]
        }
    end
    private  def check_admin
        unless current_user.is_admin?
          flash[:danger] = t ".not_permission"
        end
    end
end
