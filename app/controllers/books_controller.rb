class BooksController < InheritedResources::Base


    def book_params
      params.require(:book).permit(:id,:reader_id, :title, :description, :averageRating, :publishingHouse, :ISBN,:image)
    end

    def show
      @book = Book.find(params[:id])
    end

    def reserved
      @book = Book.find(params[:id])
    end

end




