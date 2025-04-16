module ApplicationHelper
  def format_brazilian_phone(phone)
    # Remove caracteres não numéricos e o "+55" se existir
    digits = phone.to_s.gsub(/\D/, '').sub(/^55/, '')

    # Aplica a máscara brasileira: (XX) 9XXXX-XXXX
    if digits.match?(/^\d{2}9?\d{8}$/)
      digits.sub(/^(\d{2})(\d{5})(\d{4})$/, '(\1) \2-\3')
    else
      phone # Retorna original se não for válido
    end
  end
end
