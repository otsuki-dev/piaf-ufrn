class PagesController < ApplicationController
  def about
  end

  def home_off
  end

  def home_on
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
