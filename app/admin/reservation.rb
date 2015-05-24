ActiveAdmin.register Reservation do

	config.per_page = 30

    #filters
    filter :received
    filter :returned
    filter :reader, :as => :select
    filter :receivedDate
    filter :returnedDate
    filter :updated_at

	#index
    index do
      selectable_column
      column :received
      column :returned
      column :receivedDate
      column :returnedDate
      column "Reader" do |r|
        obj = Reader.find(r.reader_id)
        link_to obj.name + " " + obj.lastname, admin_reader_path(obj)
      end 
      column :updated_at
      actions
    end

    #update
    form :html => { :enctype => "multipart/form-data" } do |f|
      f.inputs "Details" do
      f.inputs :received
      f.inputs :returned
      f.inputs :receivedDate
      f.inputs :returnedDate
      end
      f.actions
    end

    #read
    show do 
      attributes_table do
        row :received
      	row :returned
      	row :receivedDate
      	row :returnedDate
      	row :reader_id
      	row :created_at
      	row :updated_at
        # Will display the image on show object page
      end
    end

end
