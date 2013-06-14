class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @reviews = @movie.reviews
    @review = @movie.reviews.new
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(params[:movie])

    if @movie.save
      redirect_to @movie, notice: "Movie added"
    else
      redirect_to new_movie_path, notice: "There was an error creating your movie"
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(params[:movie])
      redirect_to @movie, notice: "Movie updated"
    else
      redirect_to edit_movie_path(@movie), notice: "There was an error updating your movie"
    end
  end

  def destroy
    @movie = Movie.find(params[:id])

    if @movie.delete
      redirect_to movies_path, notice: "Moviefilm deleted"
    else
      redirect_to movies_path, notice: "There was an error deleting your moviefilm"
    end
  end
end
