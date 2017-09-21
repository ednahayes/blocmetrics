Rails.application.routes.draw do
  devise_for :users#, :skip => [:registrations]                                          
  #as :user do
    #get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'    
    #put 'users' => 'devise/registrations#update', :as => 'user_registration'            
  #end
  
  #get 'welcome/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

end
