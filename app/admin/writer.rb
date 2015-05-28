ActiveAdmin.register Writer do

  actions :index, :new, :create, :update, :edit

#filters
    filter :name, :label => "Imię"
    filter :lastname, :label => "Nazwisko"
    filter :nationality, :label => "Narodowość"

	#index
    index do
      selectable_column
      column "Imię", :name
      column "Nazwisko", :lastname
      column "Narodowość", :nationality
      column "Biografia", :biography
      actions
    end

    #update
    form :html => { :enctype => "multipart/form-data" } do |f|
      f.inputs "Details" do
      f.input :name, :label => "Imię"
      f.input :lastname, :label => "Nazwisko"
      f.input :nationality, :label => "Narodowość"
      f.input :biography, :label => "Biografia"
      end
      f.actions 
    end

end
