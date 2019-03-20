class AddOauthExpiresAtToPeople < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :oauth_expires_at, :datetime
  end
end
