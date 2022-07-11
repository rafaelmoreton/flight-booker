Rails.application.routes.draw do
  get 'flights/new'
  get 'flights/', to: "flights#index"
  get 'bookings/new', to: "bookings#new"
  post 'bookings/', to: "bookings#create", as: :booking_new
  get 'bookings/', to: "bookings#index", as: :bookings
  get 'bookings/:id', to: "bookings#show", as: :booking
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "flights#index"
end
