class AddLatitudeToShops < ActiveRecord::Migration
  def change
    add_column :shops, :latitude, :float
  end
end
