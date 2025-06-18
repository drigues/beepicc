Rails.application.routes.draw do
  root "pages#home"

  devise_for :users

  resource :dashboard, only: [:show]
  get "/editor", to: "profiles#edit", as: :edit_profile
  patch "/editor", to: "profiles#update"

  get "/u/:username", to: "profiles#show", as: :public_profile

  resource :analytics, only: [:show]
  resource :settings, only: [:show, :update]

  match "*path", to: "errors#not_found", via: :all
end
