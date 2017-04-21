class ReviewsController < ApplicationController
  def show
    @review = Review.find(params[:id])
    @comments = @review.comments
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

  def update
    if current_user
      @review = Review.find(params[:id])
      @release = Release.find(params[:release_id])
      if params[:commit] == "Upvote"
        @review.votes += 1
        @review.save
      elsif params[:commit] == "Downvote"
        @review.votes -= 1
        @review.save
      end
      redirect_to release_path(@release)
    else
      flash[:notice] = "You must be logged in to do that"
      redirect_to new_user_session_path
    end
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
