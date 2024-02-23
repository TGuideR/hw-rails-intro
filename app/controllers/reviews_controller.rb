class ReviewsController < ApplicationController
    before_filter :has_moviegoer_and_movie, :only => [:new, :create]
    
    protected
    def has_moviegoer_and_movie
      @current_user ||= Moviegoer.find(session[:user_id]) if session[:user_id].present?
      unless @current_user
        flash[:warning] = 'You must be logged in to create a review.'
        redirect_to login_path
      end
      unless (@movie = Movie.find_by_id(params[:movie_id]))
        flash[:warning] = 'Review must be for an existing movie.'
        redirect_to movies_path
      end
    end
    
    public
    def new
      @review = @movie.reviews.build
    end
  
    def create
      # since moviegoer_id is a protected attribute that won't get
      # assigned by the mass-assignment from params[:review], we set it
      # by using the << method on the association.  We could also
      # set it manually with review.moviegoer = @current_user.
      @movie = Movie.find(params[:movie_id]) # Find the movie based on the ID
      @review = @movie.reviews.build(review_params) # Build a new review for this movie
      @review.moviegoer = @current_user # Associate the review with the current user
    
      if @review.save
        redirect_to movie_path(@movie), notice: 'Review was successfully created.'
      else
        render :new
      end
    end
  
    def index
      @movie = Movie.find(params[:movie_id])
      @reviews = @movie.reviews
    end

    def review_params
      params.require(:review).permit(:potatoes, :comments)
    end
  end