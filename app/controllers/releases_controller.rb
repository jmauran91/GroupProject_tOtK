class ReleasesController < ApplicationController
  def index
    @releases = Release.all
  end

  def show
    @release = Release.find(params[:id])
    @release_genres = @release.genres
    @reviews = @release.reviews
    @review = Review.new
  end

  def new
    @genre_collection = Genre.all
    @release = Release.new
  end

  def create
    if current_user
      @user = current_user
      @release = Release.new(release_params)
      @release.user = @user
      @release.genres = Genre.where(id: params[:release][:genre_ids])
      if @release.save
        flash[:notice] = "Release saved successfully."
        redirect_to release_path(@release)
      else
        @genre_collection = Genre.all
        render :new
      end
    else
      flash[:notice] = "You must be logged in"
      redirect_to new_user_session_path
    end
  end

  def edit
    @release = Release.find(params[:id])
    @genre_collection = Genre.all
  end

  def update
    @release = Release.find(params[:id])
    if @release.update(release_params)
      flash[:notice] = "Release successfully updated"
      redirect_to release_path(@release)
    else
      @genre_collection = Genre.all
      render :edit
    end
  end

  def destroy
      release = Release.find(params[:id])
      reviews = release.reviews
      reviews.each do |review|
        review.comments.each do |comment|
          comment.destroy
        end
        review.destroy
      end
      release.destroy
      flash[:notice] = "Release successfully deleted"
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
      :album_art_url,
      :description
    )
  end
end
