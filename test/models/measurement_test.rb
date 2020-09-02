require 'test_helper'

class MeasurementTest < ActiveSupport::TestCase
  test "should have a positive quantity" do
    measurement = measurements(:one)
    measurement.quantity = -1
    assert_not measurement.valid?
  end
end
