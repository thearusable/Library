class ReadersController < InheritedResources::Base
	before_action :authenticate_reader!
  
   def showBorrow
    @borrowId = Reservation.find(params[:borrowID])
    @notes = Review.where(:book_id => @borrowId.book_id) 
    @countNotes = @notes.count
    @suma = 0
     if !@notes.nil? 
    @notes.each do |note| 
      @suma+=note.score
    end 
    end
     if !@notes.nil?
    @average = @suma/@countNotes
  else @average = 0
  end
   end
    
    def searching
       @books = Book.where( 'title LIKE ?', "%#{params[:title]}%").limit(15)
       @writers = Writer.where( 'name LIKE ?', "%#{params[:title]}%").limit(15)
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
 
  def editProfile
    @readerData = Reader.where(:id => current_reader.id)
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

   @book = Book.find(params[:id_book])

  end

  def reserved
     @book = Book.find(params[:id_book])
     
  end

  def mark
    @mark = params[:review]
    @comment = params[:comment]
    @note = Review.create(:score => @mark, :comment => @comment, :book_id => params[:id_book], :reader_id => current_reader.id )
  end


  private
    def reader_params
      params.require(:reader).permit(:name, :phone, :adress)
    end

end

