Rails.application.routes.draw do
  devise_for :librarians, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

devise_for :readers ,:controllers => {:passwords => "passwords",:registrations => "registrations"}#, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }

resources :readers

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
get 'reader/:id/books/:id_book' => 'readers#showBook'

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
post 'reader/:id/books/:id_book/reserved' => 'readers#reserved'
get 'reader/:id/editProfile' => 'readers#editProfile'

end
