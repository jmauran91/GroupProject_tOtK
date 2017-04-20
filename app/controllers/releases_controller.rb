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
<<<<<<< HEAD
    if current_user
      @user = current_user
      @release = Release.new(release_params)
      @release.user = @user
      @release.save
      redirect_to root_path

   else
      binding.pry
      flash[:alert] = 'You must be logged in to do that'

      redirect_to new_user_session_path
    end
=======
    @release = Release.create!(release_params)
    redirect_to root_path
>>>>>>> 7071063193b7b44eb529daf6bd301f93c5bd4d52
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
<<<<<<< HEAD
      :album_art_url,

=======
      :album_art_url
>>>>>>> 7071063193b7b44eb529daf6bd301f93c5bd4d52
    )
  end

end
