Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/update'
  get 'users/edit'
  devise_for :users,  controllers: {
    confirmations: 'confirmations', 
    invitations: 'invitations'
  } 
  resources :dashboard, only: [:index]
  resources :home, only: [:index]
  root to: "home#index"
  
  post "accounts/new", to: "accounts#create"

  resources :users
  resources :accounts
  resources :companies
  resources :packages
  resources :documents
  
end
