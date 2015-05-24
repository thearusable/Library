ActiveAdmin.register Reader do

	config.per_page = 30

    #filters
    filter :name
    filter :lastname
    filter :email
    filter :adress
    filter :last_sign_in_at

	#index
    index do
      selectable_column
      column :name
      column :lastname
      column :email
      column :adress
      column :last_sign_in_at
      actions
    end

    #update
    form :html => { :enctype => "multipart/form-data" } do |f|
      f.inputs "Details" do
      f.input :name
      f.input :lastname
      f.input :email
      f.input :adress
      f.input :phone
      end
      f.actions
    end

    #read
    show do 
      attributes_table do
        row :name
        row :lastname
        row :email
        row :adress
        row :phone
        row :last_sign_in_at
        row :updated_at
        # Will display the image on show object page
      end
    end

end
