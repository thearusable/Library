class Book < ActiveRecord::Base
	has_and_belongs_to_many :writers
	has_many :reviews
	belongs_to :category
end
