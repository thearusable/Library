BooksCount.times do |n|
    r = Book.new
    r.title =  Faker::Name.title
    r.description = Faker::Hacker.say_something_smart
    r.releaseDate = Faker::Date.backward(Random.rand(1000))
    r.publishingHouse = Faker::Company.name
    r.ISBN = Faker::Number.number(6)
    r.image = File.open("app/assets/images/#{rand(4)}.png")
    r.category_id =  Faker::Lorem.paragraph
    id = Random.rand(Category.all.count) + 1
    r.category_id = id
    cat = Category.find(id)
    cat.booksCount = cat.booksCount + 1
    
    cat.save
    r.save
end 

#writers - ready
WritersCount.times do |n|
    r = Writer.new
    r.name =  Faker::Name.name
    r.biography =  Faker::Lorem.paragraph
    r.nationality = Faker::Address.country
    r.image = File.open("app/assets/images/#{rand(4)}.png")

    r.books << Book.find(n+1)
    r.books << Book.find(n+1+(BooksCount/2))
    r.books << Book.find(Random.rand(BooksCount)+1)
    
    r.save!
end