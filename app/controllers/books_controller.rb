class BooksController < InheritedResources::Base

  private

    def book_params
      params.require(:book).permit(:title, :author, :thumbnail)
    end
end

