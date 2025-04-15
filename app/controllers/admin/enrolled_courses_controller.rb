module Admin
    class EnrolledCoursesController < ApplicationController
        before_action :authenticate_user!
        before_action :require_admin

        def index
            @user = User.find(params[:user_id])
            @enrollments = @user.enrollments.includes(:course)
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