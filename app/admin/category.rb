ActiveAdmin.register Category do

  permit_params :name, :booksCount

	filter :name, :label => "Nazwa Kategorii"

  actions :index, :new, :create, :update, :edit

	config.per_page = 30

	#index
    index do
    selectable_column
      column "Nazwa Kategorii", :name
      column "Liczba Książek", :booksCount
      actions
    end
    #update
    form :html => { :enctype => "multipart/form-data" } do |f|
      f.inputs "Szczegóły:" do
      f.input :name, :label => "Nazwa Kategorii"
      f.input :booksCount, :label => "Liczba Książek"
      end
      f.actions
    end

end
