User.create!(
  admin: true,
  username: "admin",
  cpf: "10987654321",
  ufrn_student: false,
  phone_number: "84999999999",
  birthdate: Date.new(1990, 1, 1),
  email: "admin@example.com",
  password: "senha123",
  password_confirmation: "senha123"
)
