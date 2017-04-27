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
      resources :releases
    end
  end
  resources :users

  namespace :api do
    namespace :v1 do
      resources :comments
    end
  end

  namespace :api do
    namespace :v1 do
      resources :reviews do
        resources :points
      end
    end
  end


  root "releases#index"
end
