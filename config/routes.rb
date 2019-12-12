Rails.application.routes.draw do
  
 
  
  get 'package_comments/new'
  get 'package_comments/create'
  get 'package_comments/show'
  get 'package_comments/update'
  get 'package_comments/delete'
  get 'package_comments/edit'
  post "accounts/new", to: "accounts#create"

  
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
    resources :accounts, only: [:index, :show]
  end

  resources :associates do 
    resources :accounts, only: [:index, :show]
  end
  
 

  resources :packages do
    resources :package_comments
  end


  resources :accounts do
    resources :packages
  end

  
end
