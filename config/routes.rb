Rails.application.routes.draw do
  devise_for :users
  resources :releases do
    resources :reviews
  end
  resources :users, only: [:show]

  root "releases#index"
end
