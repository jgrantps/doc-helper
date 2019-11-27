Rails.application.routes.draw do
  
  post "accounts/new", to: "accounts#create"

  #garbage routes for testing
  
  #end of garbage routes
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
    resources :companies
    resources :accounts, only: [:index, :show]
    resources :packages, only: [:index, :show]
  end
  
  resources :companies do
    get  "users/all", to: "companies#all"
    get  "users/managers", to: "companies#managers"
    get  "users/admins", to: "companies#admins"
    get  "users/contacts", to: "companies#contacts"
    resources :users, only: [:show]
    resources :packages, only: [:show, :index]
  end
  
  resources :packages do 
    get  "users/all", to: "companies#all"
    get  "users/managers", to: "companies#managers"
    get  "users/admins", to: "companies#admins"
    get  "users/contacts", to: "companies#contacts"
    resources :users, only: [:show]
    resources :documents
  end

  resources :accounts
  resources :packages
  resources :documents
  
end
