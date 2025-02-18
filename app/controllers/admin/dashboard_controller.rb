class Admin::DashboardController < ApplicationController
    before_action :authenticate_user!
    before_action :require_admin
  
    def index
      @courses = Course.all
    end
  
    private
  
    def require_admin
      unless current_user.admin?
        redirect_to root_path, alert: "Acesso negado."
      end
    end
  end