Rails.application.routes.draw do
  root to: "boats#index"
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:show]
  resources :boats do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:destroy]
end
