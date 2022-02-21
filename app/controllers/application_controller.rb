class ApplicationController < ActionController::Base
  # Allowlist approach for user access
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  # Additional user details
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name username])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name username])
  end
end
