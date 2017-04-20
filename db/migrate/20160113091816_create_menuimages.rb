class CreateMenuimages < ActiveRecord::Migration
  def change
    create_table :menuimages do |t|
      t.references :shop, index: true, foreign_key: true
      t.string :image

      t.timestamps null: false
    end
  end
end
