class BooksController < InheritedResources::Base


    def book_params
      params.require(:book).permit(:id,:reader_id, :title, :description, :averageRating, :publishingHouse, :ISBN,:image)
    end

    def show
      @book = Book.find(params[:id])
      @notes = Review.where(:book_id => params[:id])
      @countNotes = @notes.count
       @suma = 0
    @notes.each do |note| 
      @suma+=note.score
    end 
    if !@notes.nil?
    @average = @suma/@countNotes
	else @average = 0
	end
    end

    def reserved
      @book = Book.find(params[:id])
    end
#def searching
#  @books = Book.search(params[:title])
#end

end




