class AddForecastToMountains < ActiveRecord::Migration
  def change
    add_column :mountains, :latest_forecast, :string
  end
end
