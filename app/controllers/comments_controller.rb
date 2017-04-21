class CommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @review = Review.find(params[:review_id])
    @comment = Comment.new
  end

  def create
    if current_user
      @review = Review.find(params[:review_id])
      @release = @review.release
      @comment = Comment.new(comment_params)
      @comment.user = current_user
      @comment.review = @review
      @comment.save
      redirect_to release_path(@release)
    else
      flash[:notice] = "You must be logged in to do that"
      redirect_to new_user_session_path
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(
      :body
    )
  end

end
