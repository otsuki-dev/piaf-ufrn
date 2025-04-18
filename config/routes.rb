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
    resources :enrolled_courses, only: [:index], param: :user_id do
      collection do
        delete ':user_id/remove_enrollment/:enrollment_id', action: :remove_enrollment, as: :remove_enrollment
        post ':user_id/send_email', action: :send_email, as: :send_email
      end
    end
  end

  devise_scope :user do
    authenticated :user do
      get "meus-cursos", to: "users/sessions#enrolled_courses", as: :user_enrolled_courses
    end
  end

  resources :enrollments, only: [ :destroy ]

  resources :courses do
    member do
      get "results"
      get "enrolled_users"
      delete "remove_enrollment"
    end
    
    resources :enrollments, only: [:new, :create]
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
