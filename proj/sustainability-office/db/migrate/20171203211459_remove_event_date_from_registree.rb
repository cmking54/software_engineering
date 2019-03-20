class RemoveEventDateFromRegistree < ActiveRecord::Migration[5.1]
  def change
    remove_column :registrees, :eventDate, :datetime
  end
end
