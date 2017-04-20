class AddPostalToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :postal_code1, :integer
    add_column :owners, :postal_code2, :integer
  end
end
