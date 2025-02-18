class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :username, presence: true, uniqueness: true
  validates :cpf, presence: true, uniqueness: true, format: { with: /\A\d{11}\z/, message: "deve ter 11 dígitos" }
  validates :birthdate, presence: true
  validates :ufrn_registration_number, presence: true, if: -> { ufrn_student? }
  validates :phone_number, format: { with: /\A\d{10,15}\z/, message: "deve conter apenas números e ter entre 10 e 15 dígitos" }

  has_many :courses, foreign_key: 'user_id', dependent: :destroy
  has_many :enrollments, dependent: :destroy
  has_many :enrolled_courses, through: :enrollments, source: :course
  def admin?
    self.admin
  end
end
