Rails.application.routes.draw do
  devise_for :users
  resources :releases, only: [:index, :show, :create, :new, :edit, :update, :destroy] do
    resources :reviews, only: [:create, :new, :destroy, :edit, :update]
  end

  resources :reviews, only: [:create, :new, :destroy, :edit, :update] do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :users, only: [:index, :show, :destroy]
  resources :genres, only: [:show]
  #resources :comments, only: [:show, :update, :destroy]

  namespace :api do
    namespace :v1 do
      resources :releases do
        resources :reviews
      end
    end
  end
  resources :users




  root "releases#index"
end
