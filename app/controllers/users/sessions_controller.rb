class Users::SessionsController < Devise::SessionsController
  before_action :authenticate_user!, only: :enrolled_courses

  def enrolled_courses
    @enrollments = current_user.enrollments.includes(:course)
  end
  
  protected
  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_dashboard_path
    else
      root_path 
    end
  end
end