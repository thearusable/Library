ActiveAdmin.register Librarian do

	menu if: proc{ current_librarian.admin? } #only for admin

  permit_params :name, :email, :admin, :adress, :phone, :password

  actions :index, :new, :create, :update, :edit

  config.per_page = 50
  config.batch_actions = false

  scope :all, :default => true
  scope :Administratorzy do
    Librarian.where({admin: true})
  end
  scope :Bibliotekarze do 
    Librarian.where({admin: false})
  end

    #filters
    filter :admin, :label => "Admininistrator?"
    filter :name, :label => "Imię i Nazwisko"
    filter :email, :label => "Email"
    filter :adress, :label => "Adres"
    filter :last_sign_in_at, :label => "Ostatnie Logowanie"

	#index
    index do
      column "Imię i Nazwisko" do |l|
        link_to l.name, edit_admin_librarian_path(l)
      end
      column "Email", :email
      column "Administrator?", :admin
      column "Ostatnie Logowanie", :last_sign_in_at
      actions
    end

    #update
    form :html => { :enctype => "multipart/form-data" } do |f|
      f.inputs "Szczegóły:" do
      f.input :name, :label => "Imię i Nazwisko"
      f.input :email, :label => "Email"
      f.input :admin, :label => "Administrator?"
      f.input :adress, :label => "Adres"
      f.input :phone, :label => "Telefon"
      end
      f.actions
    end
end
