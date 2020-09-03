class Api::V1::MeasurementsController < ApplicationController
  before_action :check_login, only: %i[index show create]

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

  def create
    measurement = current_user.measurements.build(measurement_params)

    if measurement.save
      render json: measurement, status: 201
    else
      render json: { errors: measurement.errors }, status: 422
    end
  end

  def update

  end

  private

    def measurement_params
      params.require(:measurement).permit(:total,:category, product_ids: [])
    end
end
