class EmailsController < ApplicationController
    before_action :authenticate_user!
    before_action :require_admin
  
    def create
      recipients = case params[:recipient_type]
                  when 'all'
                    User.all
                  when 'active_course'
                    Course.find(params[:course_id]).enrollments.map(&:user)
                  when 'finished_course'
                    Course.find(params[:course_id]).enrollments.map(&:user)
                  else
                    []
                  end
  
      if recipients.any?
        recipients.each do |user|
          UserMailer.send_email(user, params[:subject], params[:message]).deliver_now
        end
        redirect_to admin_dashboard_path, notice: 'E-mails enviados com sucesso!'
      else
        redirect_to admin_dashboard_path, alert: 'Nenhum destinatário selecionado.'
      end
    end
  
    private
  
    def require_admin
      unless current_user.admin?
        redirect_to root_path, alert: 'Acesso negado.'
      end
    end
  end