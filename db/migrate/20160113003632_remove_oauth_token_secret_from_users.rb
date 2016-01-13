class RemoveOauthTokenSecretFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :oauth_token_secret
    remove_column :users, :screen_name
  end

  def down
    add_column :users, :oauth_token_secret
    add_column :users, :screen_name
  end
end
