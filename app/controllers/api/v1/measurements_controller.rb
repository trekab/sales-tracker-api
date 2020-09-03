class Api::V1::MeasurementsController < ApplicationController
  before_action :check_login, only: %i[index]

  def index
    render json: MeasurementSerializer.new(current_user.measurements).serializable_hash
  end
end
