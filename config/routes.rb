Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :categories

  get '/about' => 'welcome#about'
  root 'welcome#home'

  #devise_for :users, :skip => :registrations
  #devise_for :admins, :librarians, :readers, :skip => :sessions

  # routes for all users
#authenticated :user do
#end

# routes only for users
#authenticated :librarian, lambda {|u| u.type == "Librarian"} do
#end

# routes only for companies
#authenticated :reader, lambda {|u| u.type == "Reader"} do
#end

  #devise_for :users, :controllers => {:sessions => 'sessions'}, :skip => :registrations 
  #devise_for :admins, :librarians, :readers, :skip => :sessions
  #devise_for :users, skip: [:registrations]
  #devise_for :admins, skip: [:sessions,:registrations]
  #devise_for :librarians, skip: [:sessions,:registrations]
  #devise_for :readers

  #devise_for :users do
  #  delete 'logout', to: 'sessions#destroy', as: :destroy_user_session
    #get 'login', to: 'sessions#new', as: :new_user_session
    #put 'login', to: 'sessions#create', as: :user_session
  #end

  #namespace :admin do
    #root :to => "rails_admin"
  #  resources :profile, only: [:edit, :update]
  #end
  #namespace :librarian do
    #root :to => '/manage'
  #  resources :profile, only: [:edit, :update]
  #end
  #namespace :reader do
    #root :to => 'categories#index'
  #  resources :profile, only: [:edit, :update]
  #end


  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
