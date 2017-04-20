class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, null: false, default: 'user'
    add_index :users, :username, unique: true
  end
end
