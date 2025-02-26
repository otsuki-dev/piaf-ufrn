class EnrollmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course, only: [:new, :create]
  before_action :set_enrollment, only: [:destroy]

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

  def destroy
    if @enrollment.course.registration_period_open?
      @enrollment.destroy
      redirect_to user_enrolled_courses_path, notice: 'Inscrição cancelada com sucesso.'
    else
      redirect_to user_enrolled_courses_path, alert: 'Não é possível cancelar a inscrição após o término do período de inscrições.'
    end
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_enrollment
    @enrollment = current_user.enrollments.find(params[:id])
  end
end