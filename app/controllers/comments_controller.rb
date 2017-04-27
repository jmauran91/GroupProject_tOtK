class CommentsController < ApplicationController

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @review = Review.find(params[:review_id])
    @release = @review.release
    @release_genres = @release.genres
    @comment = Comment.new
  end

  def create
    if current_user
      @review = Review.find(params[:review_id])
      @release = @review.release
      @comment = Comment.new(comment_params)
      @comment.user = current_user
      @comment.review = @review
      if @comment.save
        flash[:notice] = "Your comment has been posted."
        redirect_to release_path(@release)
      else
        @release_genres = @release.genres
        render :new
      end
    else
      flash[:notice] = "You must be logged in to do that"
      redirect_to new_user_session_path
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @review = Review.find(params[:review_id])
    @release = Release.find(@review.release_id)
    @release_genres = @release.genres
  end

  def update
    comment = Comment.find(params[:id])
    release = comment.review.release
    if comment.update(comment_params)
      flash[:notice] = "Comment successfully updated"
      redirect_to release_path(release)
    else
      @release = release
      @release_genres = release.genres
      render :edit
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    review = Review.find(comment.review_id)
    release = Release.find(review.release_id)
    comment.destroy
    flash[:notice] = "Comment deleted"
    redirect_to release_path(release)
  end

  private

  def comment_params
    params.require(:comment).permit(
      :body
    )
  end
end
