class ReviewsController < ApplicationController

  def show
    @review = Review.find(params[:id])
  end

  def new
    @release = Release.find(params[:release_id])
    @review = Review.new
  end

  def create
    @release = Release.find(params[:release_id])
    if current_user
      @review = Review.new(review_params)
      @review.user = current_user
      @review.release = @release
      @review.save
      redirect to release_path(@release)
    else
      flash[:notice] = "You must be logged in to do that"
      redirect_to new_user_session_path
    end
  end

  def update
  @review = Review.find(params[:id])
  @release = Release.find(params[:release_id])
    if params[:commit] == "Upvote"
      @review.votes += 1
      @review.save
    elsif params[:commit] == "Downvote"
      @review.votes -=1
      @review.save
    end
  redirect_to release_path(@release)
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
