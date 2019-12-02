Rails.application.routes.draw do
  
 
  
  

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
    
  end

  resources :accounts 
end
