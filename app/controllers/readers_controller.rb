class ReadersController < InheritedResources::Base
	before_action :authenticate_reader!
  
   def booking
   end
    
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

    def booking
     @book = Book.where(:id => bookID)
        if !@book.current_reservation_id == nil
      Reservation.create(:received=>false, :returned=>false, :receivedDate=>nil, :returnedDate=>nil, :reader_id => params[:id], :book_id=>params[:bookID])
      return 1
        else return 0 
        end
    end
=end
  private
    def reader_params
      params.require(:reader).permit(:name, :lastname)
    end

end

