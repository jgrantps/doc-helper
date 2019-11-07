Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/update'
  get 'users/edit'
  devise_for :users,  controllers: {
    confirmations: 'confirmations'
  } 
  resources :users
  resources :dashboard, only: [:index]
  resources :home, only: [:index]
  root to: "home#index"
end
