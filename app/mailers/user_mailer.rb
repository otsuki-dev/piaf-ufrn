class UserMailer < ApplicationMailer
    default from: 'piaf-ufrn@gmail.com'
  
    def send_email(user, subject, message)
      @user = user
      @message = message
      mail(to: @user.email, subject: subject)
    end
  end