Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :show, :destroy]
  resources :users, only: [:new, :create, :show]
  root "tasks#index"
  resources :tasks do
    collection do
      get "search"
    end
  end
end
