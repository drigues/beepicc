Rails.application.routes.draw do
  get "migrations/run"
  # Homepage
  root "pages#home"

  # Devise authentication
  devise_for :users

  # Dashboard (using :index)
  get "/dashboard", to: "dashboard#index", as: :dashboard

  # Profile Editor and Public Profile
  get "/editor", to: "profiles#edit", as: :edit_profile
  patch "/editor", to: "profiles#update"
  get "/u/:username", to: "profiles#show", as: :public_profile

  # Analytics and Settings
  resource :analytics, only: [:show]
  resource :settings, only: [:show, :update]

  resources :links do
    member do
      post :track_click
    end
  end

  # Legal pages
  get "/terms",   to: "pages#terms"
  get "/privacy", to: "pages#privacy"
  get "/cookies", to: "pages#cookies"

  # Catch-all error route — must be LAST
  match "*path", to: "errors#not_found", via: :all

  if Rails.env.production?
    get "/run_migrations", to: "migrations#run"
  end
end
