Rails.application.routes.draw do
  devise_for :users
  resources :releases, only: [:index, :show, :create, :new, :edit, :update, :destroy] do
    resources :reviews, only: [:create, :new, :destroy, :edit, :update]
  end

  resources :reviews, only: [:create, :new, :destroy, :edit, :update] do
    resources :comments, only: [:new, :create, :edit, :update]
  end
  resources :users, only: [:index, :show, :destroy]
  resources :genres, only: [:show]
  resources :comments, only: [:show, :update, :destroy]


  root "releases#index"
end
