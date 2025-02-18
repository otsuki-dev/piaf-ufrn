class EnrollmentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_course, only: [:new, :create]
  
    def new
      @enrollment = Enrollment.new
    end
  
    def create
      @enrollment = @course.enrollments.build(user: current_user)
      if @enrollment.save
        redirect_to @course, notice: 'Inscrição realizada com sucesso!'
      else
        render :new
      end
    end
  
    private
  
    def set_course
      @course = Course.find(params[:course_id])
    end
  end