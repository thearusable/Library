class ReadersController < InheritedResources::Base
	before_action :authenticate_reader!
  
   def showBorrow
  
    @borrowId = Reservation.find(params[:borrowID])
    
   
     
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

   @book = Book.find(params[:id])
   @notes = Review.where(:book_id => params[:id]) 
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
  def reserved
     @book = Book.find(params[:id_book])
     @notes = Review.where(:book_id => params[:id]) 
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

  def mark
=begin    @mark = params[:review]
    @comment = params[:comment]
    @bookId = Reservation.find(params[:borrow])
    @isMarked = Review.where(:book_id => @bookId.book_id, :reader_id => current_reader.id)
      if !@mark.nil?
        @note = Review.create(:score => @mark, :comment => @comment, :book_id => @bookId.book_id, :reader_id => current_reader.id )
        flash[:notice] = 'Twoja ocena została dodana!' 
      else 
        flash[:alert] = 'Dodaj ocenę!' 
        redirect_to :back
      end
=end
  end


  private
    def reader_params
      params.require(:reader).permit(:name, :phone, :adress)
    end

end

