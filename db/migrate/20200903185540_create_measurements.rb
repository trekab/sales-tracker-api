class CreateMeasurements < ActiveRecord::Migration[6.0]
  def change
    create_table :measurements do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :category
      t.integer :total

      t.timestamps
    end
  end
end
