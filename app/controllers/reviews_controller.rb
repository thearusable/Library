class Review < ActiveRecord::Base
  ratyrate_rateable "score"
end