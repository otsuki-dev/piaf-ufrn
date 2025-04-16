module Admin
    class EnrolledCoursesController < ApplicationController
        before_action :authenticate_user!
        before_action :require_admin

        def index
            @user = User.find(params[:user_id])
            @enrollments = @user.enrollments.includes(:course)
        end

        def send_email
            @user = User.find(params[:user_id])
            subject = params[:subject]
            message = params[:message]
            
            UserMailer.send_email(@user, subject, message).deliver_now
            
            redirect_to admin_enrolled_courses_path(user_id: @user.id), 
                        notice: 'Email enviado com sucesso!'
          rescue => e
            redirect_to admin_enrolled_courses_path(user_id: @user.id), 
                        alert: "Erro ao enviar email: #{e.message}"
          end

        def remove_enrollment
            @user = User.find(params[:user_id])
            enrollment = @user.enrollments.find(params[:enrollment_id])
            
            if enrollment.destroy
              redirect_back fallback_location: admin_enrolled_courses_path(user_id: @user.id), 
                           notice: 'Inscrição removida com sucesso!'
            else
              redirect_back fallback_location: admin_enrolled_courses_path(user_id: @user.id), 
                           alert: 'Erro ao remover inscrição.'
            end
        end

        def require_admin
            unless current_user.admin?
              redirect_to root_path, alert: "Acesso negado."
            end
        end
    end
end