class RemoveAddressAndForecastFromMountains < ActiveRecord::Migration
  def up
    remove_column :mountains, :address
    remove_column :mountains, :latest_forecast
  end

  def down
    add_column :mountains, :address
    add_column :mountains, :latest_forecast
  end
end
