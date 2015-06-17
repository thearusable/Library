class ReadersController < InheritedResources::Base
	before_action :authenticate_reader!
  
   def showBorrow
   end
    
    def searching
       @books = Book.where( 'title LIKE ?', "%#{params[:title]}%")
       @writers = Writer.where( 'name LIKE ?', "%#{params[:title]}%")
       @writers.each do |writer|
       @books = @books + writer.books
      end
    end

    def my_reservations
        @reservations = Reservation.where({reader_id: params[:id], received: false})  
    end

    def my_borrows
      @borrows = Reservation.where({reader_id: params[:id], received: true})
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

  def forgottenPassword
  end
  def showBook
    @book = Book.find(params[:id])
  end

  private
    def reader_params
      params.require(:reader).permit(:name, :lastname)
    end

end

