class Book < ActiveRecord::Base
	has_and_belongs_to_many :writers
	has_many :reviews
	belongs_to :category


has_attached_file :image, :styles => { :medium => "238x238>", :thumb => "100x100>" }
validates_attachment :image, content_type: { content_type:     ["image/jpg", "image/jpeg", "image/png"] }
end
