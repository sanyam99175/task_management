Rails.application.routes.draw do
  resources :tasks
  devise_for :users

  root to: "tasks#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
