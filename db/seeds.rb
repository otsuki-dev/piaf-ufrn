User.create!(
  admin: true,
  instructor: true,
  username: "Otsuki",
  cpf: "21515404056",
  ufrn_student: false,
  phone_number: "84999999997",
  birthdate: Date.new(1990, 1, 1),
  email: "otsuki.dev@outlook.com",
  password: "FfsKC.7LqWKA54N",
  password_confirmation: "FfsKC.7LqWKA54N",
  rg_user: "0231029",
  address: "Rua",
  cep: "4802349",
  district: "bairro",
  confirmed_at: Time.current
)
