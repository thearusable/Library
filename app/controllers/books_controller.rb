class BooksController < InheritedResources::Base

  private

    def book_params
      params.require(:book).permit(:title, :description, :averageRating, :publishingHouse, :ISBN,:image)
    end
end

