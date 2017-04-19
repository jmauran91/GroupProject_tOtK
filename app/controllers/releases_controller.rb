class ReleasesController < ApplicationController

  def index
    @releases = Release.all
  end

  def show
    @release = Release.find(params[:id])
  end

  def new
    @release = Release.new
  end

  def create
    @release = Release.create!(release_params)
    redirect_to root_path
  end

  private

  def release_params
    params.require(:release).permit(
      :title,
      :artist,
      :performer,
      :year,
      :studio,
      :no_of_tracks,
      :album_art_url
    )
  end

end
