Rails.application.routes.draw do
  get 'flights/new'
  get 'flights/', to: "flights#index"
  get 'bookings/new', to: "bookings#new"
  get 'bookings', to: "bookings#index", as: :bookings
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "flights#index"
end
