class AddLongitudeToShops < ActiveRecord::Migration
  def change
    add_column :shops, :longitude, :float
  end
end
