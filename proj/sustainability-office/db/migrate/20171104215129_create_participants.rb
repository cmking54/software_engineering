class CreateParticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :participants do |t|
      t.datetime :eventDate
      t.integer :user_id 
      t.integer :event_id 

      t.timestamps
    end
  end
end
