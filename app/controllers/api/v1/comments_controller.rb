class Api::V1::CommentsController < ApplicationController

  def index
    @review = Review.find(params[:review_id])
    @comments = @review.comments
    render json: @comments
  end

  def show
    render json: Comment.find(params[:id])
  end
end
