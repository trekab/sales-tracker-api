class RemoveQuantityFromMeasurements < ActiveRecord::Migration[6.0]
  def change
    remove_column :measurements, :quantity, :decimal
  end
end
