Rails.application.routes.draw do
  resources :teams
  devise_for :users
  resources :users do
    member do
      patch :join_team
    end
  end
  root "home#index"
end
