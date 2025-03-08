class SendEnrollmentEndedEmailsJob < ApplicationJob
  queue_as :default

  def perform(course)
    course.users.each do |user|
      CourseMailer.enrollment_ended_email(user, course).deliver_now
    end
  end
end