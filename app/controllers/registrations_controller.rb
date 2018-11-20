class RegistrationsController < Devise::RegistrationsController
  layout false
  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)

    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      flash[:notice] = "Update Succesfull"
      bypass_sign_in resource, scope: resource_name
      respond_with resource, location: after_update_path_for(resource)
    else
      clean_up_passwords resource
      set_minimum_password_length
      flash[:error] = resource.errors.full_messages
       redirect_to user_profile_home_path(id:@current_user.id)
    end
  end
    private
  def sign_up_params
    params.require(:user).permit(:full_name, :email, :password, :password_confirmation, :avatar, :avatar_cache, :remove_avatar)
  end
  def account_update_params
    params.require(:user).permit(:full_name, :email, :password, :password_confirmation, :current_password, :avatar, :avatar_cache, :remove_avatar)
  end
  
  
  
protected
  def after_update_path_for(resource)
      user_profile_home_path(id:@current_user.id)
  end
end 