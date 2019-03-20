class AddUidToPeople < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :uid, :string
  end
end
