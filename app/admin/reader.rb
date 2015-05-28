ActiveAdmin.register Reader do

  permit_params :name, :lastname, :email, :adress, :phone

	config.per_page = 30

  actions :index, :new, :create, :update, :edit

    #filters
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
      column "Adres", :adress
      column "Ostatnio Widziany", :last_sign_in_at
      actions
    end

    #update
    form :html => { :enctype => "multipart/form-data" } do |f|
      f.inputs "Details" do
      f.input :name, :label => "Imię"
      f.input :lastname, :label => "Nazwisko"
      f.input :email, :label => "Email"
      f.input :adress, :label => "Adres"
      f.input :phone, :label => "Telefon"
      end
      f.actions
    end


end
