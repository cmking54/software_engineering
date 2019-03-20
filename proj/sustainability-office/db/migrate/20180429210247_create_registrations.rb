class CreateRegistrations < ActiveRecord::Migration[5.1]
  def change
    create_table :registrations do |t|
      t.references :person, foreign_key: true
      t.references :meeting, foreign_key: true

      t.timestamps
    end
  end
end
