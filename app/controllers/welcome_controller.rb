class WelcomeController < ApplicationController
  def index
  	 render file:'app/views/welcome/index'
  end
  def newBooks
  	 render file:'app/views/welcome/newBooks'
  end
  def about
  	 render file:'app/views/welcome/about'
  end
end
