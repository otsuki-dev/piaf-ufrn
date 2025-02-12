Rails.application.routes.draw do
  get "/sobre" => "pages#about"

  get "pages/home_on"

  devise_for :users

  authenticated :user do
    root 'pages#home_on', as: :home 
  end

  unauthenticated do
    root 'pages#home_off' 
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
