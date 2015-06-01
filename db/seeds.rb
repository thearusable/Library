#how many
UsersCount = 20
ReservationsCount = 50
BooksCount = 100
WritersCount = 200
ReviewsCount = 300


#separate seed files
Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }

