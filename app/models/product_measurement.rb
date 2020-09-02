class ProductMeasurement < ApplicationRecord
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }, presence: true
  belongs_to :product
  belongs_to :measurement
end
