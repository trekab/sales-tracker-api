class CreateMeasurements < ActiveRecord::Migration[6.0]
  def change
    create_table :measurements do |t|
      t.string :category
      t.decimal :quantity
      t.belongs_to :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
