Rails.application.routes.draw do
  

  devise_for :readers, :controllers => {:passwords => "passwords"}

  get 'newBooks' => 'welcome#newBooks'
  get 'about' => 'welcome#about'
  get 'login' => 'welcome#login'
  get 'register' => 'welcome#register'
  get 'forgottenPassword' => 'welcome#passwordNewPage'

  resources :books
   get 'newBooks/:id' => 'books#show'

  resources :reservations

  root 'welcome#index'
 
 get 'reader/:id' => 'readers#searching'

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


  devise_for :librarians, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

end
