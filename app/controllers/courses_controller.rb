class CoursesController < ApplicationController
    before_action :authenticate_user!
    before_action :require_admin, except: [:index, :show]
  
    def index
      @courses = Course.all
    end
  
    def show
      @course = Course.find(params[:id])
    end
  
    def new
      @course = Course.new
    end
  
    def create
      @course = current_user.courses.build(course_params)
      if @course.save
        redirect_to admin_dashboard_path, notice: 'Curso criado com sucesso!'
      else
        render :new
      end
    end
  
    def enrolled_users
        @course = Course.find(params[:id])
        @enrollments = @course.enrollments.includes(:user)
    end

    private
  
    def course_params
      params.require(:course).permit(:start_date, :end_date, :class_time, :slots, :modality, :custom_modality)
    end
  
    def require_admin
      unless current_user.admin?
        redirect_to root_path, alert: 'Acesso negado.'
      end
    end
  end