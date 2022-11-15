Rails.application.routes.draw do
  get 'bookings/tool:references'
  get 'bookings/user:references'
  get 'bookings/starting_date:date'
  get 'bookings/end_date:date'
  get 'bookings/status:integer'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
