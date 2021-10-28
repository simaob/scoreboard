Rails.application.routes.draw do
  resources :submissions
  resources :teams
  devise_for :users
  resources :users
  root "home#index"
end
