class ApplicationController < ActionController::Base
  private
  # If your model is called User
  def after_sign_in_path_for(resource)
    session["user_return_to"] || root_path
  end
end
