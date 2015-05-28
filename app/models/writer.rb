class Writer < ActiveRecord::Base
	has_and_belongs_to_many :books


	has_attached_file :image, :styles => { :normal => "512x512", :medium => "238x238>", :thumb => "32x32>" }
	validates_attachment :image, content_type: { content_type:     ["image/jpg", "image/jpeg", "image/png"] }
end
