ActiveAdmin.register Librarian do

	menu if: proc{ current_librarian.admin? } #only for admin

  permit_params :name, :lastname, :email, :admin, :adress, :phone

  actions :index, :new, :create, :update, :edit

	config.per_page = 30

  scope :all, :default => true
  scope :Admins do
    Librarian.where({admin: true})
  end
  scope :Librarians do 
    Librarian.where({admin: false})
  end

    #filters
    filter :admin, :label => "Admin?"
    filter :name, :label => "Imię"
    filter :lastname, :label => "Nazwisko"
    filter :email, :label => "Email"
    filter :adress, :label => "Adres"
    filter :last_sign_in_at, :label => "Ostatnio Widziany"

	#index
    index do
      selectable_column
      column "Imię", :name
      column "Nazwisko", :lastname
      column "Email", :email
      column "Admin?", :admin
      column "Ostatnio Widziany", :last_sign_in_at
      actions
    end

    #update
    form :html => { :enctype => "multipart/form-data" } do |f|
      f.inputs "Details" do
      f.input :name, :label => "Imię"
      f.input :lastname, :label => "Nazwisko"
      f.input :email, :label => "Email"
      f.input :admin, :label => "Admin?"
      f.input :adress, :label => "Adres"
      f.input :phone, :label => "Telefon"
      end
      f.actions
    end
end
