class Api::V1::MeasurementsController < ApplicationController
  before_action :check_login, only: %i[index show]

  def index
    render json: MeasurementSerializer.new(current_user.measurements).serializable_hash
  end

  def show
    measurement = current_user.measurements.find(params[:id])

    if measurement
      options = { include: [:products] }
      render json: MeasurementSerializer.new(measurement, options).serializable_hash
    else
      head 404
    end
  end
end
