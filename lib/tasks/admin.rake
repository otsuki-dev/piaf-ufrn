namespace :admin do
  desc "Cria um usuário administrador"
  task create: :environment do
    if User.exists?(email: "felipesbm2005@gmail.com")
      puts "Já existe um administrador com o email fornecido."
    else
      User.create!(
        admin: true,
        username: "xaolinnn",
        cpf: "11111111111",
        ufrn_student: false,
        ufrn_registration_number: nil, # Explícito para evitar problemas
        phone_number: "84987824987",
        birthdate: Date.new(2005, 10, 31),
        email: "felipesbm2225@gmail.com", # Email corrigido
        password: "-Qzyz6C23abWH4e",
        password_confirmation: "-Qzyz6C23abWH4e",
        confirmed_at: Time.current # Pula a confirmação de email
      )
      puts "Usuário administrador criado com sucesso! ;)"
    end
  rescue StandardError => e
    puts "Erro ao criar usuário administrador: #{e.message}"
    puts e.backtrace.join("\n")
  end
end
