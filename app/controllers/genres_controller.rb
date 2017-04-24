class GenresController < ApplicationController
  before_action :set_genre, only: [:show]

  def show
    @releases = @genre.releases
  end


  private
    def set_genre
      @genre = Genre.find(params[:id])
    end
end
