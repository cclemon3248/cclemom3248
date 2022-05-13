Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end
  
  resources :sessions, only: [:new, :create, :show, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  root "tasks#index"
  resources :tasks do
    collection do
      get "search"
    end
  end
end
