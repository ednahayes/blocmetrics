Rails.application.routes.draw do
  
  resources :registeredapps

  namespace :api, defaults: { format: :json } do
    match '/events', to: 'events#preflight', via: [:options]  
    resources :events, only: [:create]
  end
   
   
  devise_for :users#, :skip => [:registrations]                                          
  #as :user do
    #get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'    
    #put 'users' => 'devise/registrations#update', :as => 'user_registration'            
  #end
  
  #get 'welcome/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get 'about' => 'welcome#about'
  
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

end
