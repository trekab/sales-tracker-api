# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class MeasurementsControllerTest < ActionDispatch::IntegrationTest
      setup do
        @measurement = measurements(:one)
        @measurement_params = { measurement: {
          product_ids: [products(:one).id, products(:two).id],
          category: measurements(:one).category,
          total: 50
        } }
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

      test 'should show measurement' do
        get api_v1_measurement_url(@measurement),
            headers: { Authorization: JsonWebToken.encode(user_id: @measurement.user_id) }, as: :json
        assert_response :success

        json_response = JSON.parse(response.body)
        include_product_attr = json_response['included'][0]['attributes']
        assert_equal @measurement.products.first.title, include_product_attr['title']
      end

      test 'should forbid create measurement for unlogged users' do
        assert_no_difference('Measurement.count') do
          post api_v1_measurements_url, params: @measurement_params, as: :json
        end
        assert_response :forbidden
      end

      test 'should create measurement with two products' do
        assert_difference('Measurement.count', 1) do
          post api_v1_measurements_url, params: @measurement_params,
                                        headers: { Authorization: JsonWebToken.encode(user_id: @measurement.user_id) },
                                        as: :json
        end
        assert_response :created
      end
    end
  end
end
