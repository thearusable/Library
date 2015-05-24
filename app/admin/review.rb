ActiveAdmin.register Review do

 #filters
    filter :score
    filter :comment
    filter :book, :as => :select
    filter :reader, :as => :select
    filter :updated_at

	#index
    index do
      selectable_column
      column :score
      column :comment
      column "Book" do |r|
  		link_to Book.find(r.book_id).title, admin_book_path(r.book_id)
	  end 
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
      f.inputs :score
      f.inputs :comment
      f.inputs :book
      f.inputs :reader
      end
      f.actions
    end

    #read
    show do 
      attributes_table do
        row :score
      	row :comment
      	row :book
      	row :reader
      	row :created_at
      	row :updated_at
        # Will display the image on show object page
      end
    end


end
