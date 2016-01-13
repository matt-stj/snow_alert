class AddNewestForecastToUsers < ActiveRecord::Migration
  def change
    add_column :users, :newest_forecast, :text
  end
end
