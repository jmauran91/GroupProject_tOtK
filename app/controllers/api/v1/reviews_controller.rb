class Api::V1::ReviewsController < ApplicationController

  skip_before_filter  :verify_authenticity_token

  def index
    render json: Review.all, include: [:points]
  end

  def show
    @release = Release.find(params[:release_id])
    @reviews = @release.reviews
    render json: @reviews, include: [:points]

  end

  def edit
    render json: Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:review_id])
    if current_user
      if @review.points.find_by_user_id(current_user.id)
        @point = @review.points.find_by_user_id(current_user.id)
      else
        @point = Point.create!(review_id: @review.id, user_id: current_user.id )
      end
      if @point.upvote == false && params[:upvote] == true && params[:downvote] == false
          @point.upvote = true
          @point.downvote = false
      elsif @point.upvote == true && params[:upvote] == true && params[:downvote] == false
          @point.upvote = false
          @point.downvote = false
      elsif @point.downvote == false && params[:downvote] == true && params[:upvote] == false
          @point.downvote = true
          @point.upvote = false
      elsif @point.downvote == true && params[:downvote] == true && params[:upvote] == false
          @point.downvote = true
          @point.upvote = true
      end
      @point.save
      if @point.upvote == true && @point.downvote == false
        @review.votes += 1
      elsif @point.downvote == true && @point.upvote == false
        @review.votes -= 1
      elsif @point.upvote == false && @point.downvote == false
        @review.votes -= 1
        @point.update_attributes(upvote: false, downvote: false)
      elsif @point.downvote == true && @point.upvote == true
        @review.votes +=1
        @point.update_attributes(upvote: false, downvote: false)
      end
    else
      flash[:error] = @review.errors.full_messages
    end
    @review.save
    @release = Release.find(params[:release_id])
    @reviews = @release.reviews
    render json: @reviews, include: [:points] 
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
end
