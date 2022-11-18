Rails.application.routes.draw do
  devise_for :users
  root to: "tools#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # To generate nested paths
  resources :tools do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, only: %i[index show edit update destroy]
  get '/my_tools', to: 'tools#my_tools', as: :my_tools

  get '/accept/:id', to: 'bookings#accept', as: :accept_booking
  get '/decline/:id', to: 'bookings#decline', as: :decline_booking
end
