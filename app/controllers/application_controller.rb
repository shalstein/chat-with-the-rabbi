class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.json { head :forbidden, content_type: 'text/html' }
        format.html { redirect_to user_path(current_user), notice: exception.message }
        format.js   { head :forbidden, content_type: 'text/html' }
      end
    end



  protected

  def configure_permitted_parameters
    added_attrs = [:dob, :name, :role]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def after_sign_in_path_for(resource)
    user_path(resource)
  end






end
