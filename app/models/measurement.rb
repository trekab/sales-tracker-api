class Measurement < ApplicationRecord
  validates :category, presence: true

  has_many :product_measurements
  has_many :products, through: :product_measurements 
end
