class User < ApplicationRecord
  # Include default devise modules...
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # Validações
  validates :username, presence: true, uniqueness: true
  validates :cpf, presence: true, uniqueness: true
  validate :cpf_must_be_valid
  validates :birthdate, presence: true
  validates :ufrn_registration_number, presence: true, if: -> { ufrn_student? }
  # Callback para formatar o telefone antes de salvar
  before_save :format_brazilian_phone

  # Associações
  has_many :courses, foreign_key: "user_id", dependent: :destroy
  has_many :enrollments, dependent: :destroy
  has_many :enrolled_courses, through: :enrollments, source: :course

  def admin?
    self.admin
  end

  def instructor?
    self.instructor
  end

  private

  # Validação de CPF
  def cpf_must_be_valid
    unless CPF.valid?(cpf)
      errors.add(:cpf, "inválido")
    end
  end

  # Formatação do telefone no padrão brasileiro: (XX) 9XXXX-XXXX
  def format_brazilian_phone
    return if phone_number.blank?

    # Remove tudo que não é dígito
    digits = phone_number.to_s.gsub(/\D/, "")

    # Aplica a formatação se tiver 11 dígitos (DDD + 9 dígitos)
    if digits.match?(/^(\d{2})(\d{5})(\d{4})$/)
      self.phone_number = digits.sub(/^(\d{2})(\d{5})(\d{4})$/, '(\1) \2-\3')
    end
  end
end
