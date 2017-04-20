class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :area
      t.string :address
      t.string :email
      t.string :tel
      t.string :url
      t.string :owner

      t.timestamps null: false
    end
  end
end
