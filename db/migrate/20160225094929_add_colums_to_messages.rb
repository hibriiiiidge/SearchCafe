class AddColumsToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :user_id, :integer
    add_column :messages, :shop_id, :integer
  end
end
