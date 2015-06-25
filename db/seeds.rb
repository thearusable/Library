#how many
UsersCount = 200
ReservationsCount = 50
BooksCount = 400
WritersCount = 200
ReviewsCount = 300


#separate seed files
Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }

