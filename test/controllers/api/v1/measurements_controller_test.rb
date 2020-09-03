require 'test_helper'

class Api::V1::MeasurementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @measurement = measurements(:one)
  end

  test "should show a measurement" do
    get api_v1_measurement_url(@measurement), as: :json
    assert_response :success
    
    json_response = JSON.parse(self.response.body)
    assert_equal @measurement.category, json_response['category']
  end
end
