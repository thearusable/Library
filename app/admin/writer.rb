ActiveAdmin.register Writer do

#filters
    filter :name
    filter :lastname
    filter :nationality

	#index
    index do
      selectable_column
      column :name
      column :lastname
      column :nationality
      actions
    end

    #update
    form :html => { :enctype => "multipart/form-data" } do |f|
      f.inputs "Details" do
      f.inputs :name
      f.inputs :lastname
      f.inputs :nationality
      f.inputs :biography
      end
      f.actions
    end

    #read
    show do 
      attributes_table do
        row :name
      	row :lastname
      	row :nationality
      	row :biography
      	row :created_at
      	row :updated_at
        # Will display the image on show object page
      end
    end


end
