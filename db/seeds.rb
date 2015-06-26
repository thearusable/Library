#how many
UsersCount = 10
ReservationsCount = 5
BooksCount = 40
WritersCount = 20
ReviewsCount = 100


#separate seed files
Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }

