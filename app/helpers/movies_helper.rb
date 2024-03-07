#Helper Module
module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    oddness = count.odd? ?  "odd" :  "even"
  end
end
