Rails.application.routes.draw do
  get 'bookings/index'

  devise_for :users
  root to: "pages#home"
  get 'mybookings', to: "users#bookings"
  get 'mylistings', to: 'users#listings'
  resources :yachts do
    resources :bookings
    resources :reviews
  end

  resources :bookings, only: [] do
    member do
      patch :accept
      patch :reject
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
