class AddPostalcodeToShops < ActiveRecord::Migration
  def change
    add_column :shops, :postal_code1, :integer
    add_column :shops, :postal_code2, :integer
  end
end
