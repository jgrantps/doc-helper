Rails.application.routes.draw do
  
 
  
 
  get 'positions/new'
  get 'positions/create'
  get 'positions/update'
  get 'positions/delete'
  get 'positions/index'
  get 'positions/show'
  get 'positions/edit'
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
    resources :associates
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

  resources :package_comments 
  
  resources :accounts do
    resources :packages
  end

  
end
