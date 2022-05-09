Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  root "tasks#index"
  resources :tasks do
    collection do
      get "search"
    end
  end
end
