class BooksController < InheritedResources::Base

  private

    def book_params
      params.require(:book).permit(:title, :description, :averageRating, :publishingHouse, :ISBN,:image)
    end


#def searching
#  @books = Book.search(params[:title])
#end


=begin
    def searching
    	puts "sdsdsbjsha"
      if params[:title]
         @books = Book.search(params[:title]).order("created_at DESC")
      else
         @books = Book.all.order("created_at DESC")

	@books.each do |b|
		b.title
	end
      puts "<table>"
      @books.each do |book|
          puts "<tr><td>"
          puts book[:title]
      end
      puts "</table>"
     end
=end 
   # end

end

=begin		 <%= link_to 'Moje rezerwacje', {controller: "readers", action: 'my_reservations'} %>
<%= link_to 'Moje wypożyczenia', {controller: "readers", action: 'my_borrows'} %>




  <%= form_tag books_path, :method => "get") do %>
			  <%= label_tag(:title, "Search") %>
			  <%= text_field_tag(:title, params[:title]) %>
			  <%= submit_tag("Search", class:"button radius") %>
			  <%end%>
=end