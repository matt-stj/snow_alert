class CreateMountains < ActiveRecord::Migration
  def change
    create_table :mountains do |t|
      t.string :name
      t.string :latitude
      t.string :longitude

      t.timestamps null: false
    end
  end
end
