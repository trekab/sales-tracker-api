require 'test_helper'

class ProductMeasurementTest < ActiveSupport::TestCase
  test "should have a positive quantity" do
    product_measurement = product_measurements(:one)
    product_measurement.quantity = -1
    assert_not product_measurement.valid?
  end
end
