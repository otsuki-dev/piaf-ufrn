class Course < ApplicationRecord
    belongs_to :admin, class_name: 'User', foreign_key: 'user_id'
    has_many :enrollments, dependent: :destroy
    has_many :users, through: :enrollments

    validates :start_date, :end_date, :class_time, :slots, :modality, presence: true

    after_save :schedule_enrollment_ended_emails, if: :saved_change_to_end_date?

    scope :active, -> { where("end_date >= ?", Time.current) }

    scope :finished, -> { where("end_date < ?", Time.current) }

    def schedule_enrollment_ended_emails
      SendEnrollmentEndedEmailsJob.set(wait_until: end_date).perform_later(self)
    end

    def registration_period_open?
        now = Time.current
        start_date <= now && end_date >= now
    end

    def self.send_enrollment_ended_emails
      courses = Course.where("end_date <= ?", Time.current)
    
      courses.each do |course|
        course.users.each do |user|
          CourseMailer.enrollment_ended_email(user, course).deliver_now
        end
      end
    end
end
