Rails.application.routes.draw do
  devise_for :users
  root to: "tools#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # To generate nested paths
  resources :tools do
    resources :bookings, only: [ :new, :create ]
  end

  resources :bookings, only: [ :index, :show, :edit, :update, :destroy ]
end
