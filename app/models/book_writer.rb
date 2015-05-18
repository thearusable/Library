class BookWriter < ActiveRecord::Base
	belongs_to :writer 
	belongs_to :book 
end
