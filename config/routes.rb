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
  
  resource :packages, only: [:new, :create, :update, :edit, :delete]

  resources :packages do
    resources :package_comments
  end


  resources :accounts do
    resources :packages, only: [:index, :show]
  end

  
end
