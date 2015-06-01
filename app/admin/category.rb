ActiveAdmin.register Category do

  permit_params :name

	filter :name, :label => "Nazwa Kategorii"

  actions :index, :new, :create, :update, :edit

  config.per_page = 50
  config.batch_actions = false

	#index
    index do
      column "Nazwa Kategorii", :name
      column "Liczba Książek", :booksCount
      actions
    end
    #update
    form :html => { :enctype => "multipart/form-data" } do |f|
      f.inputs "Szczegóły:" do
      f.input :name, :label => "Nazwa Kategorii"
      end
      f.actions
    end

end
