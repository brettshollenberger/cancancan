class ReviewsController < ApplicationController
  def index
  end

  def new
  end

  def create
    if current_user
      @movie = Movie.find(params[:movie_id])
      @review = @movie.reviews.new(params[:review])
      @review.user = current_user

      if @review.save
        redirect_to @movie, notice: "Review added"
      else
        redirect_to @movie, notice: "There was an error saving your review"
      end
    else
      redirect_to new_user_session_path, notice: "You need to be signed in to review a movie"
    end
  end

  def edit
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])

    if @review.update_attributes(params[:review])
      redirect_to @movie, notice: "Review updated"
    else
      redirect_to @movie, notice: "There was an error updating your review"
    end
  end

  def show
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])

    if @review.delete
      redirect_to @movie, notice: "Review deleted"
    else
      redirect_to @movie, notice: "There was an error deleting your review"
    end
  end
end
