class Admin::DashboardController < ApplicationController
    before_action :authenticate_user!
    before_action :require_admin
  
    def index
      @courses = Course.all

      now = Time.current
      @open_courses = Course.where('start_date <= ? AND end_date >= ?', now, now).order(:start_date)
      @past_courses = Course.where('end_date < ?', now).order(end_date: :desc)
      @future_courses = Course.where('start_date > ?', now).order(:start_date)
    end
  
    private
  
    def require_admin
      unless current_user.admin?
        redirect_to root_path, alert: "Acesso negado."
      end
    end
  end