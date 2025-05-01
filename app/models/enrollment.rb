class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :user_id, uniqueness: { scope: :course_id, message: 'Você já está inscrito neste curso.' }
  validates :terms_accepted, acceptance: { message: 'Você deve aceitar os termos para se inscrever.' }
  
  validate :course_registration_period_open
  validate :course_has_available_slots
  

  private
  
  def course_has_available_slots
    if course.enrollments.count >= course.slots
      errors.add(:base, 'Este curso já atingiu o número máximo de vagas.')
    end
  end
  
  def course_registration_period_open
    now = Time.current
    unless course.start_date <= now && course.end_date >= now
      errors.add(:base, 'As inscrições para este curso estão encerradas.')
    end
  end
end