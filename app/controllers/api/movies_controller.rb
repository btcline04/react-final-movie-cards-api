class Api::MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :destroy]

  def index
    render json: Movie.all
  end

  def create
    @movie = Movie.new(movie_params)
      if @movie.save
        render json: @movie
      else
        render json: @movie.errors, status: 400
      end
  end

  def show
    render json: @movie
  end

  def update
    if @movie.update(movie_params)
      render json: @movie
    else
      render json: @movie.errors, status: 400
    end
  end

  def destroy
    if @movie.destroy
      render status: 204
    else
      render json: { message: "Unable to delete movie" }, status: 400
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :plot_summary, :img_url, :run_time)
  end
end
