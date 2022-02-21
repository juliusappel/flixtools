Rails.application.routes.draw do
  get 'appliance/index'
  get 'appliance/show'
  get 'appliance/new'
  get 'appliance/create'
  get 'appliance/edit'
  get 'appliance/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
