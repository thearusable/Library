ActiveAdmin.register Writer do

  permit_params :name, :lastname, :image, :nationality, :biography

  actions :index, :new, :create, :update, :edit

#filters
    filter :name, :label => "Imię"
    filter :lastname, :label => "Nazwisko"
    filter :nationality, :label => "Narodowość"

	#index
    index do
      selectable_column
      column "Okładka" do |writer|
        image_tag(writer.image(:thumb))
      end
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
      f.input :image, :as => :file, :label => "Okładka", :hint => image_tag(f.object.image.url(:medium))
      f.input :nationality, :label => "Narodowość"
      f.input :biography, :label => "Biografia"
      end
      f.actions 
    end

end
