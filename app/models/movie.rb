#Movie Model Store anything about movie
class Movie < ActiveRecord::Base
    has_many :reviews
    has_many :moviegoers, :through=>:reviews
end