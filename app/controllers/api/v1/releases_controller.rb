class Api::V1::ReleasesController < ApplicationController
  def index
    render json: Release.all
  end

  def show
    render json: Release.find(params[:id])
  end
end
