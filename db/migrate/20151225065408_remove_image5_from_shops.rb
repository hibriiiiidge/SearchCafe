class RemoveImage5FromShops < ActiveRecord::Migration
  def change
    remove_column :shops, :image5, :string
  end
end
