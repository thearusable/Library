class Book < ActiveRecord::Base
	has_and_belongs_to_many :writers
	has_many :reviews
	belongs_to :category


has_attached_file :thumbnail, :styles => { :medium =>     "300x300#", :thumb => "200x200#" }
end
