class Api::V1::ReleasesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: Release.all
  end

  def show
    render json: Release.find(params[:id])
  end

end
