Rails.application.routes.draw do
  
 
  get 'package_comments/index'
  get 'package_comments/new'
  get 'package_comments/edit'
  post "accounts/new", to: "accounts#create"

  #garbage routes for testing
  

  devise_for :users,  controllers: {
    confirmations: 'confirmations', 
    invitations: 'invitations'
  } 
  resources :dashboard, only: [:index]
  resources :home, only: [:index]
  root to: "home#index"
  
  
  resources :users do
    resources :companies
    resources :associates, only: [:index, :show]
    resources :accounts
  end
  
  resources :companies do
    resources :associates, only: [:index, :show]
    resources :accounts
  end

  resources :accounts do
    resources :packages, only: [:index, :show, :new]
  end

  resources :accounts
  
  resources :packages do 
    resources :package_comments
  end
 
  
end
