class ApplicationController < ActionController::Base
  before_action :store_user_location!, if: :storable_location?
  before_action :banned?
  #before_action :authenticate_user!

  
  private
    def storable_location?
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
    end

    def store_user_location!
      store_location_for(:user, request.fullpath)
    end

   def after_sign_in_path_for(resource_or_scope)
     stored_location_for(resource_or_scope) || super
   end

   def after_sign_out_path_for(resource_or_scope)
     request.referrer || super
   end
   
  def banned?
    if current_user.present? && current_user.is_blocked?
      sign_out current_user
      redirect_to new_user_session_path
      flash[:error] = "This account has been suspended...."
      root_path
    end
  end
   
end