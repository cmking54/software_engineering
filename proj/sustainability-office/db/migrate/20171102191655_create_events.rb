class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.boolean :recurring
      t.integer :points
      t.text :description

      t.timestamps
    end
  end
end
