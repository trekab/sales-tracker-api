# frozen_string_literal: true

require 'test_helper'

class MeasurementTest < ActiveSupport::TestCase
  test 'Should have a positive total' do
    measurement = measurements(:one)
    measurement.total = -1
    assert_not measurement.valid?
  end
end
