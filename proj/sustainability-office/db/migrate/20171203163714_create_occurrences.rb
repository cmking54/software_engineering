class CreateOccurrences < ActiveRecord::Migration[5.1]
  def change
    create_table :occurrences do |t|
      t.datetime :date_time
      t.integer :event_id
      t.timestamps
    end
  end
end
