Rails.application.routes.draw do
  get 'booking/create'
  get 'booking/request_confirmation'
  get 'appliance/index'
  get 'appliance/show'
  get 'appliance/new'
  get 'appliance/create'
  get 'appliance/edit'
  get 'appliance/destroy'
  devise_for :users
  root to: 'pages#home'
  resources :appliances
  resources :bookings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
