Rails.application.routes.draw do
  # get 'states/index'
  # get 'states/show'

  resources :states
  resources :npi_companies
  # get 'teams/index'
  # get 'teams/show'

  resources :teams
    
  # post 'hooks/ipn_webhook', to: 'hooks#ipn_webhook'

  scope '/hooks', :controller => :hooks do
    post :ipn_webhook
  end
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
 
  #devise_for :users
  devise_for :users, :controllers => {:registrations => "registrations"}
  root to: "home#index"  
  # root "articles#index"
  # get 'home/index'
end
