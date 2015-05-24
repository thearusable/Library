ActiveAdmin.register Book do

    permit_params :title, :description, :averageRating, :publishingHouse, :ISBN,:image

    config.per_page = 30

    #filters
    filter :category
    filter :writers, :as => :select
    filter :title
    filter :publishingHouse
    filter :ISBN
    filter :releaseDate
    filter :description
    #index
    index do
      selectable_column
      column "Cover" do |book|
        image_tag(book.image(:thumb))
      end
      column :title
      column "Category" do |b|
        link_to Category.find(b.category_id).name, admin_category_path(b) 
      end
      column "Writers" do |b|
        b.writers.map{|w| w.name + " " + w.lastname}.join(", ")
      end 
      column :averageRating
      column :publishingHouse
      column :ISBN
      actions
    end

    #update
    form :html => { :enctype => "multipart/form-data" } do |f|
      f.inputs "Details" do
      f.input :title
      f.input :writers, :as => :select
      f.input :image, :as => :file, :label => "Cover", :hint => image_tag(f.object.image.url(:medium))
      f.input :publishingHouse
      f.input :ISBN
      f.input :releaseDate
      f.input :description
      end
      f.actions
    end

    #read
    show do |b|
      attributes_table do
        row :title
        row :writers
        row "Cover" do
          image_tag(b.image(:thumb))
        end
        row :averageRating
        row :publishingHouse
        row :ISBN
        row :releaseDate
        row :description
        # Will display the image on show object page
      end
    end

end
