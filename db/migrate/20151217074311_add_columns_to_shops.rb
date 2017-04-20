class AddColumnsToShops < ActiveRecord::Migration
  def change
    add_column :shops, :image1, :string
    add_column :shops, :image2, :string
    add_column :shops, :image3, :string
    add_column :shops, :image4, :string
    add_column :shops, :image5, :string
  end
end
