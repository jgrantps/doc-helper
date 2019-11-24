Rails.application.routes.draw do
  
  post "accounts/new", to: "accounts#create"
  get  "users/all", to: "users#index"
  get  "users/managers", to: "users#filtered"
  get  "users/admins", to: "users#filtered"
  get  "users/contacts", to: "users#filtered"
  
  devise_for :users,  controllers: {
    confirmations: 'confirmations', 
    invitations: 'invitations'
  } 
  resources :dashboard, only: [:index]
  resources :home, only: [:index]
  root to: "home#index"
  
  
  resources :users do
    post "/:id", to: "users#index_request"
    get  "/all", to: "users#index"
    get  "/managers", to: "users#filtered"
    get  "/admins", to: "users#filtered"
    get  "/contacts", to: "users#filtered"
  end
  resources :accounts
  resources :companies
  resources :packages
  resources :documents
  
end
