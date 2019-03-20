class ChangeParticipantsName < ActiveRecord::Migration[5.1]
  def change
    rename_table :participants, :registrees
  end
end
