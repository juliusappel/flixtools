class ApplicationController < ActionController::Base
  # Allowlist approach for user access
  before_action :authenticate_user!
  include Pundit
  skip_before_action :authenticate_user!, only: %i[home appliance show]

  after_action :verify_authorized, except: %i[home index], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :home, unless: :skip_pundit?

  def home
  end

  # Additional user details
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name username photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name username photo])
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
