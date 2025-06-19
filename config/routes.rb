Rails.application.routes.draw do
  # Homepage
  root "pages#home"

  # Devise authentication
  devise_for :users

  # Dashboard
  resource :dashboard, only: [:show]

  # Profile Editor and Public Profile
  get "/editor", to: "profiles#edit", as: :edit_profile
  patch "/editor", to: "profiles#update"
  get "/u/:username", to: "profiles#show", as: :public_profile

  # Analytics and Settings
  resource :analytics, only: [:show]
  resource :settings, only: [:show, :update]

  # Legal pages
  get "/terms",   to: "pages#terms"
  get "/privacy", to: "pages#privacy"
  get "/cookies", to: "pages#cookies"

  # Catch-all error route — must be LAST and require ErrorsController to exist
  # ⚠️ Comment this in until `ErrorsController` is defined
  # match "*path", to: "errors#not_found", via: :all
  match "*path", to: "errors#not_found", via: :all

end
