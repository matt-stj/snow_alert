class AddStateToMountains < ActiveRecord::Migration
  def change
    add_column :mountains, :state, :string
  end
end
