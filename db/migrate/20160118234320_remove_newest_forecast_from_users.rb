class RemoveNewestForecastFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :newest_forecast
  end

  def down
    add_column :users, :newest_forecast
  end
end
