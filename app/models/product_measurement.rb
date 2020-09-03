class ProductMeasurement < ApplicationRecord
  belongs_to :measurement
  belongs_to :product, inverse_of: :product_measurements
end
