ActiveAdmin.register Book do

    permit_params :title, :description, :averageRating, :publishingHouse, :ISBN,:image

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
#controller do
#    def permitted_params

#    end
#  end

form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :title
      f.input :description
      f.input :averageRating
      #f.input :releaseDate, :as => :date
      f.input :publishingHouse
      f.input :ISBN
      f.input :image, :as => :file, :hint => f.template.image_tag(f.object.image.url(:medium))
      #f.template.image_tag(f.object.image.url(:image))
      #f.input :thumbnail, :required => false, :as => :file
      #, :hint => f.template.image_tag(f.object.image.url(:small))
      # Will preview the image when the object is edited
    end
    f.actions
  end

#show do |b|
#      attributes_table do
#        row :title
#        row :description
#        row :averageRating
#        row :releaseDate
#        row :publishingHouse
#        row :ISBN
#        row :thumbnail do
#          image_tag(b.thumbnail.url(:thumb))
#        end
#        # Will display the image on show object page
#      end
#    end

end
