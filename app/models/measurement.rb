# frozen_string_literal: true

class Measurement < ApplicationRecord
  belongs_to :user
  has_many :product_measurements, dependent: :destroy
  has_many :products, through: :product_measurements

  validates :total, numericality: { greater_than_or_equal_to: 0 }
  validates :total, presence: true
  validates :category, presence: true
end
