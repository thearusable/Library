class ReadersController < InheritedResources::Base
	before_action :authenticate_reader!
  private
@reservations = Reservation.getReservations
    def reader_params
      params.require(:reader).permit(:name, :lastname)
    end
    def searching
       @books = Book.search(params[:title])
    end
    def my_reservations
      
    	render file: "readers#my_reservations"
    end

    def my_borrows
    	render file: "readers#my_borrows"
    end

    def my_statistics
    	render file: "readers#my_statistics"
    end
    def reader
       # @books = Book.find(:all, :order => "id desc", :limit => 30)
        render file: "readers#reader"

    end


end

