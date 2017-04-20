class AddLikenumsToShops < ActiveRecord::Migration
  def change
    add_column :shops, :like_nums, :integer, default: 0
  end
end
