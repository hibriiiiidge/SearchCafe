class RemoveImage2FromShops < ActiveRecord::Migration
  def change
    remove_column :shops, :image2, :string
  end
end
