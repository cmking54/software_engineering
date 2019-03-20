class CreateAttendees < ActiveRecord::Migration[5.1]
  def change
    create_table :attendees do |t|
      t.integer :user_id
      t.integer :occurrence_id
      t.text :summary

      t.timestamps
    end
  end
end
