class Api::V1::PointsController < ApplicationController

  def index
    render json: Point.all
  end

  def show
    render json: Point.find(params[:id])
  end

  def edit
    render json: Point.find(params[:id])
  end

  def update
    @point = Point.find(params[:id])
    @point.update_attributes(point_params)
    @point.save
    render json: @point
  end

  private

  def point_params
    params.fetch(:point, {}).permit(
      :user_id,
      :review_id,
      :upvote,
      :downvote
    )
  end
end
