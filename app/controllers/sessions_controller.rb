class SessionsController < Devise::RegistrationsController
  before_action :banned?
    
  def banned?
    if current_user.present? && current_user.is_blocked?
      sign_out current_user
      flash[:error] = "This account has been banned...."
      root_path
    end
  end
end