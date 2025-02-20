class PagesController < ApplicationController
  def about
  end

  def home_off
  end

  def home_on
    # Lista de nomes para escolha aleatória
    @names = ['Alice', 'Bob', 'Charlie', 'David', 'Eve']
    
    # Escolhe um nome aleatório
    @random_name = @names.sample
    
    # Se o usuário enviar um novo nome, atualizamos a variável
    if params[:new_name].present?
      @random_name = params[:new_name]
    end
    @courses = Course.all
    @greeting = case Time.current.hour
    when 5..11
      "Bom dia"
    when 12..17
      "Boa tarde"
    else
      "Boa noite"
    end
  end
end