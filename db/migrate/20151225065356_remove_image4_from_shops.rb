class RemoveImage4FromShops < ActiveRecord::Migration
  def change
    remove_column :shops, :image4, :string
  end
end
