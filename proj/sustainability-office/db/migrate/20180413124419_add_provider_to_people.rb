class AddProviderToPeople < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :provider, :string
  end
end
