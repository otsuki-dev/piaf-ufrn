class CourseMailer < ApplicationMailer
    default from: 'piaf-ufrn@gmail.com'
  
    def enrollment_ended_email(user, course)
      @user = user
      @course = course
      @results_url = results_url
      mail(to: @user.email, subject: "Inscrições encerradas para o curso: #{@course.modality}")
    end
end