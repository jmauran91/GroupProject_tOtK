Rails.application.routes.draw do
  devise_for :users
  resources :releases
  resources :users, only: [:show]

  root "releases#index"
end
