class ReviewsController < ApplicationController

  def show
    @review = Review.find(params[:id])
    @comments = @review.comments
  end

  def new
    @release = Release.find(params[:release_id])
    @release_genres = @release.genres
    @review = Review.new
  end

  def create
    @release = Release.find(params[:release_id])
    if current_user
      @review = Review.new(review_params)
      @review.user = current_user
      @review.release = @release
      if @review.save
        flash[:notice] = "Review was added successfully."
        redirect_to release_path(@release)
      else
        flash[:notice] = "Review was not saved."
        redirect_to release_path(@release)
      end
    else
      flash[:notice] = "You must be logged in to do that"
      redirect_to new_user_session_path
    end
  end

  def edit
    @release = Release.find(params[:release_id])
    @review = Review.find(params[:id])
    @release_genres = @release.genres
  end

  def update
      @review = Review.find(params[:id])
      release = Release.find(@review.release)
      if @review.update(review_params)
        flash[:notice] = "Review successfully updated"
        redirect_to release_path(release)
      else
        render :edit
      end
  end

  def destroy
    review = Review.find(params[:id])
    release = Release.find(review.release)
    comments = review.comments
    comments.each do |comment|
        comment.destroy
    end
    review.destroy
    flash[:notice] = "Review successfully deleted"
    redirect_to release_path(release)
  end

  private

  def review_params
    params.require(:review).permit(
      :body,
      :rating,
      :votes
    )
  end
end
