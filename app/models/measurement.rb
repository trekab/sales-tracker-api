class Measurement < ApplicationRecord
  validates :category, :product_id, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }, presence: true
  belongs_to :product
end
