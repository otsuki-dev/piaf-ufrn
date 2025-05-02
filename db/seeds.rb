User.create!(
  admin: true,
  username: "admin oficial",
  cpf: "21515404056",
  ufrn_student: false,
  phone_number: "84999999997",
  birthdate: Date.new(1990, 1, 1),
  email: "me@administrador.com",
  password: "password",
  password_confirmation: "password",
  rg_user: "0231029",
  address: "Rua",
  cep: "4802349",
  district: "bairro",
  confirmed_at: Time.current
)
