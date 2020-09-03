class Measurement < ApplicationRecord
  belongs_to :user

  validates :total, numericality: { greater_than_or_equal_to: 0 }
  validates :total, presence: true
  validates :category, presence: true
end
