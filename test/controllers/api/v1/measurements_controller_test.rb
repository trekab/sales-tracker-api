require 'test_helper'

class Api::V1::MeasurementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @measurement = measurements(:one)
  end

  test 'should forbid measurements for unlogged' do
    get api_v1_measurements_url, as: :json
    assert_response :forbidden
  end

  test 'should show measurements' do
    get api_v1_measurements_url,
    headers: { Authorization: JsonWebToken.encode(user_id: @measurement.user_id) }, as: :json
    assert_response :success
    
    json_response = JSON.parse(response.body)
    assert_equal @measurement.user.measurements.count, json_response['data'].count
  end
end
