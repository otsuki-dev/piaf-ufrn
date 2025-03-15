Rails.application.routes.draw do
  get "/resultados" => "pages#results", as: :results

  get "/policy" => "pages#policy", as: :policy

  devise_for :users, controllers: { sessions: "users/sessions" }

  authenticated :user do
    root "pages#home_on", as: :home
  end

  unauthenticated do
    root "pages#home_off"
  end

  namespace :admin do
    get "dashboard", to: "dashboard#index"
  end

  devise_scope :user do
    authenticated :user do
      get "meus-cursos", to: "users/sessions#enrolled_courses", as: :user_enrolled_courses
    end
  end

  resources :enrollments, only: [ :destroy ]

  resources :courses do
    member do
      get "results" => "courses#results"
    end
    resources :enrollments, only: [ :new, :create ]
    get "enrolled_users", on: :member
  end

  get "up" => "rails/health#show", as: :rails_health_check

  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  namespace :admin do
    get "dashboard", to: "dashboard#index"
  end

  resources :emails, only: [ :create ]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
