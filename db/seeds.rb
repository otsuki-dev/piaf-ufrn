User.create!(
  email: "admin@example.com",
  password: "senha123", # Defina uma senha segura
  username: "admin",
  cpf: "10987654321",
  birthdate: Date.new(1990, 1, 1),
  ufrn_student: false,
  password_confirmation: "senha123",
  admin: true
)