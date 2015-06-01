#how many
UsersCount = 20
ReservationsCount = 5
BooksCount = 40
WritersCount = 20
ReviewsCount = 30


#separate seed files
Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }

