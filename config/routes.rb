Rails.application.routes.draw do
  devise_for :librarians, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

devise_for :readers ,:controllers => {:passwords => "passwords"}#, :registrations => "registrations"}
#as :reader do 
    #get 'register' => 'devise/registrations#new'
    #post 'signin' => 'devise/sessions#create', :as => :user_session
 #   match 'register' => 'devise/registrions#new', :as => :destroy_user_session,
    #  :via => Devise.mappings[:user].sign_out_via
 # end
 devise_scope :reader do
  #get "register", to: "devise/registrations#new"
  get 'sign_up', to: 'welcome#register'
end
resources :readers
#devise_for :readers#, :controllers => {:registrations => "registrations"}

get '/readers', to: redirect('/register')

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
#post 'books/:id/reserved' => 'books#reserved'

end
