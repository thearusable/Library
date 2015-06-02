class ReadersController < InheritedResources::Base
	before_action :authenticate_reader!
  
   
    
    def searching
       @books = Book.where( 'title LIKE ?', "%#{params[:title]}%")
    end
    def my_reservations
      @reservations = Reservation.where({reader_id: params[:id], received: false})
    end

    def my_borrows
      @borrows = Reservation.where({reader_id: params[:id], received: true})
    end

    def my_statistics
    end

=begin    def reader
       # @books = Book.find(:all, :order => "id desc", :limit => 30)
    end
=end
    def booking
     

   end
    def showRes
    end

  private
    def reader_params
      params.require(:reader).permit(:name, :lastname)
    end

end

