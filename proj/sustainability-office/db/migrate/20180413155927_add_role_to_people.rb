class AddRoleToPeople < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :role, :string
  end
end
