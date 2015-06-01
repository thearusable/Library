ActiveAdmin.register Writer do

  permit_params :name, :image, :nationality, :biography

  actions :index, :new, :create, :update, :edit

  config.per_page = 50
  config.batch_actions = false

#filters
    filter :name, :label => "Imię i Nazwisko"
    filter :nationality, :label => "Narodowość"

	#index
    index do
      column "Okładka" do |writer|
        image_tag(writer.image(:thumb))
      end
      column "Imię i Nazwisko", :name
      column "Narodowość", :nationality
      column "Biografia", :biography
      actions
    end

    #update
    form :html => { :enctype => "multipart/form-data" } do |f|
      f.inputs "Szczegóły:" do
      f.input :name, :label => "Imię i Nazwisko"
      f.input :image, :as => :file, :label => "Okładka", :hint => image_tag(f.object.image.url(:medium))
      f.input :nationality, :label => "Narodowość"
      f.input :biography, :label => "Biografia"
      end
      f.actions 
    end

end
