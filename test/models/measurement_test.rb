require 'test_helper'

class MeasurementTest < ActiveSupport::TestCase
  test "should have a category" do
    measurement = measurements(:one)
    assert measurement.valid?
  end
end
