class CreateProductMeasurements < ActiveRecord::Migration[6.0]
  def change
    create_table :product_measurements do |t|
      t.references :product, null: false, foreign_key: true
      t.references :measurement, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
