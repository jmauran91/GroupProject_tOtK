Rails.application.routes.draw do
  devise_for :users
  resources :releases do
    resources :reviews
  end

  resources :reviews do
    resources :comments
  end
  resources :users, only: [:show]

  root "releases#index"
end
