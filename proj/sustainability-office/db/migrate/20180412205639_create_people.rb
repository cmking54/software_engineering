class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :admin, :default => false
      t.integer :points
      t.attachment :image

      t.timestamps
    end
  end
end
