class AddOauthTokenToPeople < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :oauth_token, :string
  end
end
