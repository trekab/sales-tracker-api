class CreateMeasurements < ActiveRecord::Migration[6.0]
  def change
    create_table :measurements do |t|
      t.string :category
      t.decimal :quantity

      t.timestamps
    end
  end
end
