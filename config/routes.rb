Rails.application.routes.draw do
  devise_for :users
  resources :releases, only: [:index, :show, :create, :new, :edit, :update, :destroy] do
    resources :reviews, only: [:create, :new, :destroy, :edit, :update]
  end

  resources :reviews do
    resources :comments
  end
  resources :users, only: [:show]
  resources :genres, only: [:show]


  root "releases#index"
end
