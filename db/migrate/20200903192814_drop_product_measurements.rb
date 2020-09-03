class DropProductMeasurements < ActiveRecord::Migration[6.0]
  def up
    drop_table :product_measurements   
  end
end
