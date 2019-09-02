Rails.application.routes.draw do
<<<<<<< HEAD
  get 'home/index'
=======
  devise_for :users
  resources :items
  root 'items#index'
>>>>>>> development
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
