Rails.application.routes.draw do
  resources :cart_items
  resources :carts
  root 'items#index'
  resources :items
  devise_for :users
  resources :show_user, only: [:show]
  

  resources :charges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
