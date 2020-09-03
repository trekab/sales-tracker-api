class DropMeasurements < ActiveRecord::Migration[6.0]
  def up
    drop_table :measurements    
  end
end
