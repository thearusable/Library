class ReadersController < InheritedResources::Base
	before_action :authenticate_reader!
  
   
    
    def searching
       @books = Book.search(params[:title])
    end
    def my_reservations
      @reservations = Reservation.where({returned: true})
    	#render file: "readers#my_reservations"
    end

    def my_borrows
    	#render file: "readers#my_borrows"
    end

    def my_statistics
    	#render file: "readers#my_statistics"
    end

    def reader
       # @books = Book.find(:all, :order => "id desc", :limit => 30)
     #   render file: "readers#reader"

    end


  private
    def reader_params
      params.require(:reader).permit(:name, :lastname)
    end

end

