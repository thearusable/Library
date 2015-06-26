class ReadersController < InheritedResources::Base
	before_action :authenticate_reader!
  
   def showBorrow
     @res = Reservation.find(params[:borrowID])
     @book = Book.find(@res.book_id)
     @cat = Category.find(@book.category_id)  
     @r = Review.where({:book_id => @book.id, :reader_id => current_reader.id})
     if @r.count > 0
      @canReview = false
     else
      @canReview = true
     end 
   end 
    
    def searching
      flash[:notice] = []
      flash[:alert] = []
      @books = Book.where(:current_reservation_id => nil).where( 'title LIKE ?', "%#{params[:title]}%").limit(15)
      @writers = Writer.where( 'name LIKE ?', "%#{params[:title]}%").limit(15)
      @writers.each do |writer|
      @books = @books + writer.books.where(:current_reservation_id => nil)
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
   @reviews = Review.where(:book_id => @book.id)
  end

  def reserved
     @book = Book.find(params[:id_book])
     
  end

  def mark
    Review.create(:score => params[:review], :comment => params[:comment], :book_id => params[:book], :reader_id => current_reader.id)
    b = Book.find(params[:book])
    b.updateRating()
    b.save
    flash[:notice] = "Twoja rezenzja została dodana!"
    redirect_to :back

  end


  private
    def reader_params
      params.require(:reader).permit(:name, :phone, :adress)
    end

end

