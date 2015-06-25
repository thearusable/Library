class AverageCache < ActiveRecord::Base
  belongs_to :rater, :class_name => "Reader"
  belongs_to :rateable, :polymorphic => true
end
