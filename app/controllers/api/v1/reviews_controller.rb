class Api::V1::ReviewsController < ApplicationController

  skip_before_filter  :verify_authenticity_token

  def index
    render json: Review.all
  end

  def show
    render json: Review.find(params[:id])
  end

  def edit
    render json: Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update_attributes(review_params)
    render json: @review
  end

  private

  def review_params
    params.fetch(:review, {}).permit(
    :body,
    :rating,
    :votes
    )
  end
end
