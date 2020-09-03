class Api::V1::MeasurementsController < ApplicationController
  # GET /measurements/1
  def show
    render json: Measurement.find(params[:id])
  end
end
