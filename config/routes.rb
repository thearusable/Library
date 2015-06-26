Rails.application.routes.draw do
  devise_for :librarians, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

root 'welcome#index'

#readers
devise_for :readers ,:controllers => {:passwords => "passwords"}

resources :readers
get 'reader/:id' => 'readers#searching'
get 'reader/:id/books/:id_book' => 'readers#showBook'



get 'readers/:id/my_reservations' => 'readers#my_reservations'
get 'readers/:id/my_reservations/showRes' => 'readers#showRes'
get 'readers/:id/my_borrows/showBorrow' => 'readers#showBorrow'
post 'reader/:id/books/:id_book/reserved' => 'readers#reserved'
get 'reader/:id/editProfile' => 'readers#editProfile'
post 'readers/:id/my_borrows/showBorrow/mark' => 'readers#mark'

resources :readers do
	member do 
		get 'my_reservations'
		get 'my_borrows'
		get 'searching' #ok
	    get 'booking'
	    get 'editProfile'
	end
end  

#welcome
get 'login' => 'welcome#login'
get 'register' => 'welcome#register'
get 'forgottenPassword' => 'welcome#passwordNewPage'


resources :books
get 'newBooks/:id' => 'books#show'

resources :reservations


 


end
