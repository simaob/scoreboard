Rails.application.routes.draw do
  resources :submissions do
    resources :votes, only: [:create, :destroy]
  end
  resources :teams
  devise_for :users
  resources :users
  get "/dashboard", to: "home#dashboard"
  root "home#index"
end
