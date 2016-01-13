class AddSnowPreferenceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :snow_preference, :integer
  end
end
