class CoursesController < ApplicationController
    before_action :authenticate_user!
    before_action :require_admin, except: [:index, :show]
    before_action :set_course, only: [:show, :edit, :update, :destroy]
  
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

    def edit
    end

    def update
      if @course.update(course_params)
        redirect_to @course, notice: 'Curso atualizado com sucesso!'
      else
        render :edit
      end
    end

    def destroy
      @course.destroy
      redirect_to root_path, notice: 'Curso deletado com sucesso!'
    end
  
    def enrolled_users
        @course = Course.find(params[:id])
        @enrollments = @course.enrollments.includes(:user)
    end

    private

    def set_course
      @course = Course.find(params[:id])
    end
  
    def course_params
      params.require(:course).permit(:start_date, :end_date, :class_time, :slots, :modality, :custom_modality)
    end
  
    def require_admin
      unless current_user.admin?
        redirect_to root_path, alert: 'Acesso negado.'
      end
    end
  end