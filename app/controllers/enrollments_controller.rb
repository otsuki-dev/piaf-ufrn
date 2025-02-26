class EnrollmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course, only: [:new, :create]

  def new
    if @course.registration_period_open?
      @enrollment = Enrollment.new
    else
      redirect_to root_path, alert: 'As inscrições para este curso estão encerradas.'
    end
  end

  def create
    if @course.registration_period_open?
      @enrollment = @course.enrollments.build(user: current_user)
      if @enrollment.save
        redirect_to @course, notice: 'Inscrição realizada com sucesso!'
      else
        flash.now[:alert] = @enrollment.errors.full_messages.join(', ')
        render :new
      end
    else
      redirect_to root_path, alert: 'As inscrições para este curso estão encerradas.'
    end
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end
end