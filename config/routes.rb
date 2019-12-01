Rails.application.routes.draw do
  
 
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
  end
  
  resources :companies do
    get  "users/all", to: "companies#all"
    get  "users/managers", to: "companies#managers"
    get  "users/admins", to: "companies#admins"
    get  "users/contacts", to: "companies#contacts"
  end


  resources :accounts
  resources :packages
  resources :documents
  
end
