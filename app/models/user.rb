class User < ApplicationRecord
  # Include default devise modules...
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :username, presence: true, uniqueness: true
  validates :cpf, presence: true, uniqueness: true
  validate :cpf_must_be_valid 
  validates :birthdate, presence: true
  validates :ufrn_registration_number, presence: true, if: -> { ufrn_student? }
  validates :phone_number, format: { with: /\A\d{10,15}\z/, message: "deve conter apenas números e ter entre 10 e 15 dígitos" }

  has_many :courses, foreign_key: 'user_id', dependent: :destroy
  has_many :enrollments, dependent: :destroy
  has_many :enrolled_courses, through: :enrollments, source: :course

  def admin?
    self.admin
  end

  private

  def cpf_must_be_valid
    unless CPF.valid?(cpf)
      errors.add(:cpf, 'inválido')
    end
  end
end
