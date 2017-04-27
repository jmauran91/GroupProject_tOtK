Rails.application.routes.draw do
  devise_for :users


  resources :releases do
    resources :reviews
  end

  resources :reviews do
    resources :comments
  end
  resources :users

  namespace :api do
    namespace :v1 do
      resources :comments
    end
  end

  namespace :api do
    namespace :v1 do
      resources :releases
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
