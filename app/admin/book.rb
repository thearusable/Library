ActiveAdmin.register Book do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
controller do
    def permitted_params
      params.permit project: [:title, :description, :averageRating, :releaseDate, :publishingHouse, :ISBN, :thumbnail]
    end
  end

form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Project Details" do
      f.input :title
      f.input :description
      f.input :averageRating
      f.input :releaseDate
      f.input :publishingHouse
      f.input :ISBN
      #f.template.image_tag(f.object.image.url(:image))
      f.input :thumbnail, :required => false, :as => :file
      #, :hint => f.template.image_tag(f.object.image.url(:small))
      # Will preview the image when the object is edited
    end
    f.actions
  end

show do |b|
      attributes_table do
        row :title
        row :description
        row :averageRating
        row :releaseDate
        row :publishingHouse
        row :ISBN
        row :thumbnail do
          image_tag(b.thumbnail.url(:thumb))
        end
        # Will display the image on show object page
      end
    end

end
