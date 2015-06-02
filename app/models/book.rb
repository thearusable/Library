class Book < ActiveRecord::Base
	has_and_belongs_to_many :writers
	has_many :reviews
	belongs_to :category
	belongs_to :reservation

has_attached_file :image, :styles => { :normal => "512x512", :medium => "238x238>", :thumb => "32x32>" }
validates_attachment :image, content_type: { content_type:     ["image/jpg", "image/jpeg", "image/png"] }

end


def self.search(search)
  if search
    find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
end




=begin
def self.search(query)
	where("title like?", "%#{query}%")
end
=end
