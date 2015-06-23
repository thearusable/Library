class WelcomeController < ApplicationController

	def login
	end
	def register
	end

	helper_method :resource, :resource_name, :devise_mapping
	def resource_name
    	:reader
  end
  def resource
    @resource ||= Reader.new
  end
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:reader]
  end
  def index
    @books = Book.all.order(:id).reverse_order.limit(10)
  end
end