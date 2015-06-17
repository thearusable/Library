Rails.application.routes.draw do
  devise_for :librarians, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :readers, :controllers => {:passwords => "passwords"}

<<<<<<< HEAD
  get 'newBooks' => 'welcome#newBooks'
  get 'about' => 'welcome#about'
  get 'login' => 'welcome#login'
  get 'register' => 'welcome#register'
  get 'forgottenPassword' => 'welcome#passwordNewPage'

  resources :books
   get 'newBooks/:id' => 'books#show'
=======
  #get 'newBooks' => 'welcome#newBooks'
 # get 'about' => 'welcome#about'
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
>>>>>>> origin/redirecting

  resources :reservations

<<<<<<< HEAD
  root 'welcome#index'
 
 get 'reader/:id' => 'readers#searching'
=======
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # You can have the root of your site routed with "root"
root 'welcome#index'
 

#root 'application#index'
  #get 'readers/sign_in' => 'layouts#index'
 
get 'reader/:id' => 'readers#searching'
get 'reader/:id/books/:id_book' => 'readers#showBook'
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
>>>>>>> origin/redirecting

resources :readers do
	member do 
		get 'my_reservations'
		get 'my_borrows'
		get 'searching'
    get 'booking'
    get 'editProfile'
	end
end  


get 'readers/:id/my_reservations' => 'readers#my_reservations'
get 'readers/:id/my_reservations/showRes' => 'readers#showRes'
get 'readers/:id/my_borrows/showBorrow' => 'readers#showBorrow'
post 'books/:id/reserved' => 'books#reserved'


  

end
