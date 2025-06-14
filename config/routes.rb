Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: "dashboard#index", as: :authenticated_root
  end

  unauthenticated :user do
    devise_scope :user do
      root to: "devise/sessions#new", as: :unauthenticated_root
    end
  end

  get "dashboard/index"

  # Health check route (optional)
  get "up" => "rails/health#show", as: :rails_health_check
end
