Rails.application.routes.draw do

  get 'newBooks' => 'welcome#newBooks'
  get 'about' => 'welcome#about'
  get 'login' => 'welcome#login'
  get 'register' => 'welcome#register'
  get 'forgottenPassword' => 'welcome#passwordNewPage'

  resources :books
   get 'newBooks/:id' => 'books#show'
# devise_for :readers do
#  	  root :to => "readers#reader"
 # end
resources :reservations

  devise_for :readers, :controllers => {:passwords => "passwords"}
  devise_for :librarians, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # You can have the root of your site routed with "root"
  root 'welcome#index'
 

#root 'application#index'
  #get 'readers/sign_in' => 'layouts#index'
 
 get 'reader/:id' => 'readers#searching'
# get 'editProfile' => 'readers#editProfile'
 #get 'reader/:id/searching/:title' => 'books#searching'

  #get 'reader/:id/:title' => 'books#searching'
 # get '/librarian/:id' => 'librarians#librarian'
 # get '/reader/params[:title]' => 'books#searching'

=begin resources :books do
	collection do
		get 'searching'
	end
end
=end

 resources :readers do
	member do 
		get 'my_reservations'
		get 'my_borrows'
		get 'searching'
		get 'my_statistics'
    get 'booking'
    get 'editProfile'
	end
end  


get 'readers/:id/my_reservations' => 'readers#my_reservations'
get 'readers/:id/my_reservations/showRes' => 'readers#showRes'

get 'readers/:id/my_borrows/showBorrow' => 'readers#showBorrow'
#get 'readers/forgottenPassword' => 'readers#forgottenPassword'
post 'books/:id/reserved' => 'books#reserved'


#match 'searching' => 'book#searching', :as => 'searching'
#map.connect 'readers/:id/searching', :controller => 'books', :action => 'searching'

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
