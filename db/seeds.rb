User.create!(
  admin: true,
  username: "admin oficial",
  cpf: "12345678902",
  ufrn_student: false,
  phone_number: "84999999997",
  birthdate: Date.new(1990, 1, 1),
  email: "me@administrador.com",
  password: "password",
  password_confirmation: "password",
  confirmed_at: Time.current
)
