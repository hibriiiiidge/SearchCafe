class RemoveImage3FromShops < ActiveRecord::Migration
  def change
    remove_column :shops, :image3, :string
  end
end
