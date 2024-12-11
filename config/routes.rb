Rails.application.routes.draw do
  resources :clients
  resources :tte_servicing_pharmacies
  resources :sites
  resources :organizations
  resources :hs_contacts
  # resources :customers

  resources :customers do
    collection {post :import}
  end

  resources :pipeline_activities
  resources :parents
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
  root to: "hs_contacts#index"  
  # root "articles#index"
  # get 'home/index'
end
