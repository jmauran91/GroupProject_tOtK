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
    @review = Review.find(params[:review_id])
    if user_signed_in?
      if params[:upvote]
        check_user_upvote(@review).save
      elsif params[:downvote]
        check_user_downvote(@review).save
      end
    end

    @release = @review.release
    @reviews = @release.reviews.order(id: :desc)
    render json: @reviews
  end

  private

  def vote_params
    params.permit(
    :review_id,
    :upvote,
    :downvote
    )
  end

  def review_params
    params.fetch(:review, {}).permit(
    :body,
    :rating,
    :votes
    )
  end

  def check_user_downvote(review)
    if Downvote.find_by(user_id: current_user.id, review_id: review.id)
      downvote = Downvote.where(user_id: current_user.id, review_id: review.id)
      downvote.destroy_all
      review.votes += 1
    elsif Upvote.find_by(user_id: current_user.id, review_id: review.id)
      Downvote.create!(user_id: current_user.id, review_id: review.id)
      upvote = Upvote.where(user_id: current_user.id, review_id: review.id)
      upvote.destroy_all
      review.votes -= 2
    else
      Downvote.create!(user_id: current_user.id, review_id: review.id)
      review.votes -= 1
    end
    review
  end

  def check_user_upvote(review)
    if Upvote.find_by(user_id: current_user.id, review_id: review.id)
      upvote = Upvote.where(user_id: current_user.id, review_id: review.id)
      upvote.destroy_all
      review.votes -= 1
    elsif Downvote.find_by(user_id: current_user.id, review_id: review.id)
      Upvote.create!(user_id: current_user.id, review_id: review.id)
      downvote = Downvote.where(user_id: current_user.id, review_id: review.id)
      downvote.destroy_all
      review.votes += 2
    else
      Upvote.create!(user_id: current_user.id, review_id: review.id)
      review.votes += 1
    end
    review
  end
end
