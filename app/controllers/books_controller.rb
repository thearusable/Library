class BooksController < InheritedResources::Base

  private

    def book_params
      params.require(:book).permit(:title, :description, :averageRating, :publishingHouse, :ISBN,:image)
    end

    def searching
    	puts "sdsdsbjsha"
      if params[:tile]
         @books = Book.search(params[:title]).order("created_at DESC")
      else
         @books = Book.all.order("created_at DESC")

	@books.each do |b|
		b.title
	end
=begin      puts "<table>"
      @books.each do |book|
          puts "<tr><td>"
          puts book[:title]
      end
      puts "</table>"
     end
=end 
    end

end

