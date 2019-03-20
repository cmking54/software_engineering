class CreateMeetings < ActiveRecord::Migration[5.1]
  def change
    create_table :meetings do |t|
      t.string :title
      t.string :location
      t.string :description
      t.integer :points
      t.datetime :date
      t.attachment :image

      t.timestamps
    end
  end
end
