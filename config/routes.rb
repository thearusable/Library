Rails.application.routes.draw do
  get 'welcome/index'

  resources :books
  devise_for :readers do
  	  root :to => "readers#reader"
end
  devise_for :librarians, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # You can have the root of your site routed with "root"
   root 'welcome#index'
  get 'about' => 'welcome#about'
  get 'newBooks' => 'welcome#newBooks'
#root 'application#index'
  get 'readers/sign_in' => 'layouts#index'
 
  get 'reader/:id' => 'readers#reader'
  get 'librarian/:id' => 'librarians#librarian'

resources :readers do
	member do 
		get 'my_reservations'
	end
end  

resources :readers do
	member do 
		get 'my_borrows'
	end
end  

#get 'reader/my_statistics' => 'readers#my_statistisc'
#get 'reader/searching' => 'readers#reader'

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
