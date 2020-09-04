# frozen_string_literal: true

class CreateProductMeasurements < ActiveRecord::Migration[6.0]
  def change
    create_table :product_measurements do |t|
      t.belongs_to :measurement, null: false, foreign_key: true
      t.belongs_to :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
