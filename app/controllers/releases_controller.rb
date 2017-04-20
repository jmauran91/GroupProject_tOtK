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
    if current_user
      @user = current_user
      @release = Release.new(release_params)
      @release.user = @user
      @release.save
      redirect_to root_path
    else
      flash[:notice] = "You must be logged in"
      redirect_to new_user_session_path
    end
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
