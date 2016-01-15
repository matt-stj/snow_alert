class AddAddressToMountains < ActiveRecord::Migration
  def change
    add_column :mountains, :address, :string
  end
end
