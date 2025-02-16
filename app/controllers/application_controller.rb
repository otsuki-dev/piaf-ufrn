class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :cpf, :birthdate, :ufrn_student, :ufrn_registration_number, :phone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :cpf, :birthdate, :ufrn_student, :ufrn_registration_number, :phone_number])
  end
end
