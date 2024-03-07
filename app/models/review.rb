#Review Model store review from user to any movie
class Review < ActiveRecord::Base
    belongs_to :movie
    belongs_to :moviegoer
    validates_associated :movie
    validates :movie_id, :presence => true
end
