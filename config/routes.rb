Rails.application.routes.draw do
  
  devise_for :users,  controllers: {
    confirmations: 'confirmations', 
    invitations: 'invitations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  } 
  resources :dashboard, only: [:index]
  resources :home, only: [:index]
  root to: "home#index"
  
  
  resources :users do
    resources :companies
    resources :associates
    resources :accounts
  end
  
  resources :positions
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
  post "accounts/new", to: "accounts#create"
  
  
end
