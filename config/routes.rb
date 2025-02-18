Rails.application.routes.draw do
  get "/sobre" => "pages#about"

  get "pages/home_on"

  devise_for :users, controllers: { sessions: 'users/sessions' }

  authenticated :user do
    root 'pages#home_on', as: :home 
  end

  unauthenticated do
    root 'pages#home_off' 
  end

  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
  end

  resources :courses do
    resources :enrollments, only: [:new, :create]
    get 'enrolled_users', on: :member
  end

  get "up" => "rails/health#show", as: :rails_health_check

  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
