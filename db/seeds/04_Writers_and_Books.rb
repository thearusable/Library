#books - ready
400.times do |n|
    r = Book.new
    r.title =  Faker::Name.title
    r.description = Faker::Hacker.say_something_smart
    r.category_id =  Faker::Lorem.paragraph
    id = Random.rand(21) + 1
    r.category_id = id
    cat = Category.find(id)
    cat.booksCount = cat.booksCount + 1
    
    cat.save
    r.save
end 

#writers - ready
400.times do |n|
    r = Writer.new
    r.name =  Faker::Name.first_name
    r.lastname = Faker::Name.last_name
    r.biography =  Faker::Lorem.paragraph
    r.nationality = Faker::Address.country
    r.books << Book.find(n+1)
    if Random.rand(1) == 1 
    	r.books << Book.find(Random.rand(399)+1)
    end
    r.save
end