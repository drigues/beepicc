# /Users/thiagorodrigues/thgo/beepicc/config/routes.rb

Rails.application.routes.draw do
  get "migrations/run"

  # Homepage
  root "pages#home"

  # Devise authentication
  devise_for :users

  # Your dashboard and profile routes
  get "/dashboard", to: "dashboard#index", as: :dashboard
  get "/editor", to: "profiles#edit", as: :edit_profile
  patch "/editor", to: "profiles#update"
  get "/:directory", to: "profiles#show", as: :public_profile

  def create_profile
    Profile.create(user: self, name: self.name)
  end

  # Dashboard
  get "/dashboard", to: "dashboard#show", as: :dashboard

  # Profile Editor and Public Profile
  get "/editor", to: "profiles#edit", as: :edit_profile
  patch "/editor", to: "profiles#update"
  get "/u/:directory", to: "profiles#show", as: :public_profile

  # Analytics and Settings
  resource :analytics, only: [:show]
  resource :settings, only: [:show, :update]

  # Links
  resources :links do
    member do
      post :track_click
    end
  end

  # Legal pages
  get "/terms", to: "pages#terms"
  get "/privacy", to: "pages#privacy"
  get "/cookies", to: "pages#cookies"

  # Run migrations manually in production
  if Rails.env.production?
    get "/run_migrations", to: "migrations#run"
  end

  # Catch-all error route — must be LAST
  match "*path", to: "errors#not_found", via: :all
end
