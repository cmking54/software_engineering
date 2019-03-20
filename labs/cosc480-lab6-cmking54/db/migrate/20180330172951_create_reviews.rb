class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :stars
      t.string :review
      t.references :product, foreign_key: true
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
