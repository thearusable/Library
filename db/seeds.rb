#how many
UsersCount = 50
ReservationsCount = 50
BooksCount = 300
WritersCount = 200
ReviewsCount = 500


#separate seed files
Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }

