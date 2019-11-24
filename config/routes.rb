Rails.application.routes.draw do
  
  post "accounts/new", to: "accounts#create"
  
  devise_for :users,  controllers: {
    confirmations: 'confirmations', 
    invitations: 'invitations'
  } 
  resources :dashboard, only: [:index]
  resources :home, only: [:index]
  root to: "home#index"
  
  
  resources :users do
    get  "/all", to: "users#all"
    get  "/managers", to: "users#managers"
    get  "/admins", to: "users#admins"
    get  "/contacts", to: "users#contacts"
  end
  resources :accounts
  resources :companies
  resources :packages
  resources :documents
  
end
