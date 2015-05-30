ActiveAdmin.register Reader do

  permit_params :name, :email, :adress, :phone

  actions :index, :new, :create, :update, :edit

  config.per_page = 50
  config.batch_actions = false

    #filters
    filter :name, :label => "Imię i Nazwisko"
    filter :email, :label => "Email"
    filter :adress, :label => "Adres"
    filter :last_sign_in_at, :label => "Ostatnie Logowanie"

	#index
    index do
      column "Imię i Nazwisko", :name
      column "Email", :email
      column "Adres", :adress
      column "Ostatnie Logowanie", :last_sign_in_at
      actions
    end

    #update
    form :html => { :enctype => "multipart/form-data" } do |f|
      f.inputs "Szczegóły:" do
      f.input :name, :label => "Imię i Nazwisko"
      f.input :email, :label => "Email"
      f.input :adress, :label => "Adres"
      f.input :phone, :label => "Telefon"
      end
      f.actions
    end


end
