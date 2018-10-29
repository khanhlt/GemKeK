class Manage::HomeController < ApplicationController
    before_action :authenticate_user!, :check_admin
    private  def check_admin
        unless current_user.is_admin?
          flash[:danger] = t ".not_permission"
        end
    end
end
