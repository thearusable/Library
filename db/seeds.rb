Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }

#fajny sposob
#(1..500).each do |cont|
#       User.create(
#         name: "User #{cont}",
#         is_premium: [true, false].sample
#       )
#     end