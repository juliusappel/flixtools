Rails.application.routes.draw do
  # get 'appliance/index'
  # get 'appliance/show'
  # get 'appliance/new'
  # get 'appliance/create'
  # get 'appliance/edit'
  # get 'appliance/destroy'
  resources :appliances
  devise_for :users
  root to: 'pages#home'
  resources :appliances do
    resources :bookings, only: %i[create]
  end
  resources :bookings, except: :create
  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
