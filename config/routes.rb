Rails.application.routes.draw do
  get 'users/show'
  get 'bookings/new'
  get 'boats/index'
  get 'boats/show'
  get 'boats/new'
  get 'boats/edit'
  devise_for :users
  root to: "boats#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:show]
  resources :boats do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:destroy]
end
