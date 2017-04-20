class AddAvatarurlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatarurl, :string
  end
end
