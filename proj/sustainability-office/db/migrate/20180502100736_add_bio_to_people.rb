class AddBioToPeople < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :bio, :string
  end
end
