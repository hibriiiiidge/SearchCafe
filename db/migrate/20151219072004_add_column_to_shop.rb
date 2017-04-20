class AddColumnToShop < ActiveRecord::Migration
  def change
    add_reference :shops, :owner, index: true, foreign_key: true
  end
end
